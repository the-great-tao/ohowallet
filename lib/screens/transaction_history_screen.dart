import 'package:ohowallet/core/exports.dart';

class TransactionHistoryItemController extends BaseController {
  OHOTransaction transaction;
  var refreshing = false.obs;

  TransactionHistoryItemController({
    required this.transaction,
  });

  @override
  void onInit() {
    super.onInit();
    refreshTransaction();
  }

  String get status => ohoTransactionStatusStringMap[transaction.status]!;

  Color get statusColor {
    if (transaction.status == OHOTransactionStatus.successful) {
      return OHOColors.statusSuccess;
    }
    if (transaction.status == OHOTransactionStatus.failed) {
      return OHOColors.statusError;
    }
    return themeService.textColor;
  }

  String get type => ohoTransactionTypeStringMap[transaction.type]!;

  String? get from => getShortAddress(transaction.from);

  String? get to => getShortAddress(transaction.to);

  String? get hash => getShortHash(transaction.hash);

  String? get submitDate => getDateString(transaction.submitDate!);

  String? get blockDate => getDateString(transaction.blockDate!);

  String? get tokenAmount => getTokenAmountString(
        transaction.tokenSymbol,
        transaction.tokenAmount,
        transaction.tokenDecimals,
      );

  String? get gasPrice => getGasPriceString(transaction.gasPrice);

  String? get effectiveGasPrice =>
      getGasPriceString(transaction.effectiveGasPrice);

  String? get feeCharged {
    if (transaction.gasUsed == null || transaction.effectiveGasPrice == null) {
      return null;
    }
    final feeCharged = BigInt.parse(transaction.gasUsed!) *
        BigInt.parse(transaction.effectiveGasPrice!);
    return getTokenAmountString(
      transaction.networkCurrencySymbol,
      feeCharged.toString(),
      18,
    );
  }

  String? getShortHash(String? hash) {
    if (hash == null) return null;
    return WalletService.getShortHex(hash, partLength: 6);
  }

  String? getShortAddress(String? address) {
    if (address == null) return null;
    return WalletService.getShortHex(address, partLength: 6);
  }

  String? getDateString(DateTime? date) {
    if (date == null) return null;
    var localDate = date.toLocal();
    var localDateA = DateFormat.yMMMMd('en_US').format(localDate);
    var localDateB = DateFormat.jm('en_US').format(localDate);
    return '$localDateA at $localDateB';
  }

  String? getTokenAmountString(
    String? tokenSymbol,
    String? tokenAmount,
    int? tokenDecimals,
  ) {
    if (tokenSymbol == null || tokenAmount == null || tokenDecimals == null) {
      return null;
    }
    final tokenAmount_ =
        BigInt.parse(tokenAmount) / BigInt.from(10).pow(tokenDecimals);
    return NumberFormat.currency(
      locale: 'en_US',
      name: tokenSymbol,
      decimalDigits: 6,
      customPattern: '#,###.# \u00a4',
    ).format(tokenAmount_);
  }

  String? getGasPriceString(String? gasPrice) {
    if (gasPrice == null) return null;
    final gasPrice_ = EtherAmount.fromUnitAndValue(EtherUnit.wei, gasPrice);
    return '${gasPrice_.getValueInUnit(EtherUnit.gwei).toStringAsFixed(6)} Gwei';
  }

  Future<void> refreshTransaction() async {
    if (transaction.status == OHOTransactionStatus.successful ||
        transaction.status == OHOTransactionStatus.failed) {
      return;
    }
    refreshing.value = true;
    try {
      final network = walletService.getNetworkByKey(transaction.networkKey!);
      final web3Client = Web3Client(network!.rpcUrl, Client());

      final hash = transaction.hash!;
      final txReceipt = await web3Client.getTransactionReceipt(hash);
      final txInformation = await web3Client.getTransactionByHash(hash);

      final blockNumber = txReceipt!.blockNumber.blockNum;
      final blockNumberHex = '0x${blockNumber.toRadixString(16)}';
      final blockInformation =
          await web3Client.getBlockInformation(blockNumber: blockNumberHex);
      final blockTimestamp = blockInformation.timestamp;
      final gasUsed = txReceipt.gasUsed!;
      final effectiveGasPrice = txReceipt.effectiveGasPrice!.getInWei;

      transaction = transaction
        ..status = txReceipt.status!
            ? OHOTransactionStatus.successful
            : OHOTransactionStatus.failed
        ..blockNumber = blockNumber
        ..blockDate = blockTimestamp
        ..nonce = txInformation.nonce
        ..input = bytesToHex(txInformation.input)
        ..gasUsed = gasUsed.toString()
        ..effectiveGasPrice = effectiveGasPrice.toString();

      await isarService.isar.writeTxn(() async {
        await isarService.ohoTransactions.put(transaction);
      });
    } catch (error) {
      print(error);
    }
    refreshing.value = false;
  }

  Future<void> launchAddress(String address) async {
    final selectedNetwork = walletService.selectedNetworkInstance;
    if (selectedNetwork == null) return;
    final blockExplorerUrl = selectedNetwork.blockExplorerUrl;
    if (blockExplorerUrl.isEmpty) return;
    launchUrl(Uri.parse('$blockExplorerUrl/address/$address'));
  }

  Future<void> copyTransactionHash(String address) async {
    await FlutterClipboard.copy(address);
    showToast(
      message: 'Transaction Hash was copied to clipboard.',
      backgroundColor: OHOColors.statusSuccess,
    );
  }

  Future<void> viewTransaction() async {
    await refreshTransaction();

    openTransactionDetailsScreen();

    double? tokenAmount;
    if (transaction.tokenAmount != null) {
      tokenAmount = BigInt.parse(transaction.tokenAmount!) /
          BigInt.from(10).pow(transaction.tokenDecimals!);
      tokenAmount = double.parse(tokenAmount.toStringAsFixed(6));
    }

    BigInt? gasUsed;
    double? feeCharged;
    if (transaction.gasUsed != null && transaction.effectiveGasPrice != null) {
      gasUsed = BigInt.parse(transaction.gasUsed!);
      feeCharged = BigInt.parse(transaction.gasUsed!) *
          BigInt.parse(transaction.effectiveGasPrice!) /
          BigInt.from(10).pow(18);
    }

    walletService.updateTransaction(
      status: transaction.status,
      type: transaction.type,
      tokenSymbol: transaction.tokenSymbol,
      tokenAmount: tokenAmount,
      tokenDecimals: 6,
      from: transaction.from,
      to: transaction.to,
      hash: transaction.hash,
      date: transaction.blockDate ?? transaction.submitDate,
      gasUsed: gasUsed,
      feeCharged: feeCharged,
      network: walletService.getNetworkByKey(transaction.networkKey!),
    );
  }
}

class TransactionHistoryItem
    extends BaseWidget<TransactionHistoryItemController> {
  TransactionHistoryItem({
    super.key,
    super.tag,
    required OHOTransaction transaction,
  }) : super(
          controller: TransactionHistoryItemController(
            transaction: transaction,
          ),
        );

  Widget get spinKitFadingCircle {
    return SpinKitFadingCircle(
      size: 60.sp,
      color: themeService.textColor,
    );
  }

  Widget get copyIcon {
    return Icon(
      FontAwesomeIcons.copy,
      size: 50.sp,
      color: themeService.textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: themeService.listItemInkwellHighlightColor,
          splashColor: themeService.listItemInkwellSplashColor,
          borderRadius: BorderRadius.circular(50.r),
          onTap: () => controller.viewTransaction(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(50.r),
                decoration: BoxDecoration(
                  color: themeService.textFieldBackgroundColor.withOpacity(0.5),
                  border: Border.all(
                      color: themeService.textFieldBorderColor, width: 5.r),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: OHOText(
                        controller.submitDate!,
                        textAlign: TextAlign.left,
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OHOText(
                          controller.type,
                          color: OHOColors.pink,
                          fontWeight: FontWeight.w500,
                        ),
                        Expanded(child: Container()),
                        OHOText(
                          controller.tokenAmount!,
                          color: OHOColors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        controller.transaction.status ==
                                    OHOTransactionStatus.successful ||
                                controller.transaction.status ==
                                    OHOTransactionStatus.failed
                            ? OHOText(
                                controller.status,
                                color: controller.statusColor,
                                fontWeight: FontWeight.w500,
                              )
                            : Row(
                                children: [
                                  OHOText(
                                    controller.status,
                                    color: controller.statusColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(width: 20.w),
                                  spinKitFadingCircle,
                                ],
                              ),
                        Expanded(child: Container()),
                        controller.transaction.hash == null
                            ? spinKitFadingCircle
                            : Row(
                                children: [
                                  OHOText(
                                    controller.hash!,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(width: 20.w),
                                  GestureDetector(
                                    onTap: () => controller.copyTransactionHash(
                                      controller.transaction.hash!,
                                    ),
                                    child: copyIcon,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              !controller.refreshing.value
                  ? Container()
                  : SpinKitFadingCircle(color: themeService.textColor),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionHistoryScreenController extends BaseController {
  static const pageSize = 10;
  final PagingController<int, OHOTransaction> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() async {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final transactions = await isarService.isar.ohoTransactions
          .where()
          .networkKeyEqualTo(walletService.selectedNetwork.value)
          .filter()
          .fromEqualTo(walletService.selectedAccount.value)
          .sortBySubmitDateDesc()
          .offset(pageKey)
          .limit(pageSize)
          .findAll();
      final isLastPage = transactions.isEmpty || transactions.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(transactions);
      } else {
        final nextPageKey = pageKey + pageSize;
        pagingController.appendPage(transactions, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}

class TransactionHistoryScreen
    extends BaseWidget<TransactionHistoryScreenController> {
  String? networkKey;
  String? accountKey;

  TransactionHistoryScreen({
    super.key,
    super.tag,
  }) : super(controller: TransactionHistoryScreenController());

  Widget get pageHeader => Column(
        children: [
          SizedBox(height: 50.h),
          OHOHeaderText('History'),
          SizedBox(height: 50.h),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkKey != walletService.selectedNetwork.value) {
        networkKey = walletService.selectedNetwork.value;
        controller.pagingController.refresh();
      }
      if (accountKey != walletService.selectedAccount.value) {
        accountKey = walletService.selectedAccount.value;
        controller.pagingController.refresh();
      }
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 500.h,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 50.w,
                right: 50.w,
              ),
              child: OHOAppBar02(hasBackButton: true),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: RefreshIndicator(
              color: themeService.textColor,
              backgroundColor: themeService.textFieldBackgroundColor,
              onRefresh: () async => controller.pagingController.refresh(),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      pageHeader,
                      OHOText(
                        'Pull to refresh History page or tap on a Transaction to refresh and view it for more details.',
                      ),
                      SizedBox(height: 100.h),
                    ]),
                  ),
                  PagedSliverList<int, OHOTransaction>.separated(
                    pagingController: controller.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<OHOTransaction>(
                      firstPageProgressIndicatorBuilder: (context) =>
                          SpinKitFadingCircle(color: themeService.textColor),
                      newPageProgressIndicatorBuilder: (context) =>
                          SpinKitFadingCircle(color: themeService.textColor),
                      itemBuilder: (context, item, index) {
                        return TransactionHistoryItem(
                          tag: 'transaction-history-item-$index',
                          transaction: item,
                        )..controller.transaction = item;
                      },
                      noItemsFoundIndicatorBuilder: (context) => Column(
                        children: [
                          pageHeader,
                          OHOText('There is no transaction.'),
                        ],
                      ),
                      noMoreItemsIndicatorBuilder: (context) =>
                          SizedBox(height: 1000.h),
                    ),
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 50.h);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
