import 'package:ohowallet/core/exports.dart';

class TokenSendScreenController extends BaseController {
  static const receivingAddressTag = 'receiving-address';
  static const tokenTag = 'token';
  static const tokenAmountTag = 'token-amount';

  var accountKey = ''.obs;
  Account? account;

  var tokenKey = ''.obs;
  Token? token;
  bool tokenRefreshing = false;

  var estimated = false.obs;
  var estimating = false.obs;
  var canSend = true.obs;
  EtherAmount gasPrice = EtherAmount.zero();
  BigInt estimatedGas = BigInt.zero;
  double estimatedFee = 0.0;
  String errorMessage = '';

  late OHOAccountAddressFieldController receivingAddressController;
  late OHOTokenChipController tokenController;
  late OHOTextFieldController tokenAmountController;

  final tokenAmountFormatters = [
    TextInputFormatter.withFunction((oldValue, newValue) {
      try {
        final text = newValue.text;
        if (text.isNotEmpty) double.parse(text);
        return newValue;
      } catch (error) {
        return oldValue;
      }
    }),
  ];

  @override
  void onInit() {
    super.onInit();
    accountKey.value = walletService.selectedAccount.value;
    account = walletService.selectedAccountInstance;
  }

  @override
  void onReady() {
    super.onReady();
    receivingAddressController =
        Get.find<OHOAccountAddressFieldController>(tag: receivingAddressTag);
    tokenController = Get.find<OHOTokenChipController>(tag: tokenTag);
    tokenAmountController =
        Get.find<OHOTextFieldController>(tag: tokenAmountTag);
  }

  void onSelectedToken(String tokenKey, Token token) {
    this.tokenKey.value = tokenKey;
    this.token = token;
    tokenRefreshing = true;
  }

  void onSelectedReceivingAccount(String accountKey, Account account) {
    if (account.address.hexEip55 ==
        walletService.selectedAccountInstance!.address.hexEip55) {
      showToast(
        message: 'You cannot send Token to your current selected Account',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }
    receivingAddressController.selectFromAccounts(account.address.hexEip55);
  }

  Future<void> openTransactionDetailsScreen() async {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          vertical: 250.h,
          horizontal: 50.w,
        ),
        child: TransactionDetailsScreen()..controller.resetData(),
      ),
    );
  }

  bool isValid() {
    var valid = true;
    valid &= tokenAmountController.isValid();

    return valid;
  }

  Future<void> estimate() async {}

  Future<void> submit() async {
    if (receivingAddressController.address.value.isEmpty) {
      showToast(
        message: 'Please enter Receiving Address.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    if (receivingAddressController.address.value ==
        walletService.selectedAccountInstance!.address.hexEip55) {
      showToast(
        message: 'You cannot send Token to your current selected Account',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    if (tokenController.token == null) {
      showToast(
        message: 'Please select Token.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    if (!isValid()) {
      showToast(
        message: 'Please check your input data.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    final networkKey = walletService.selectedNetwork.value;
    final network = walletService.selectedNetworkInstance!;
    final chainId = network.chainId.toInt();
    final token = tokenController.token!;
    final tokenName = token.symbol;

    final from = walletService.selectedAccountInstance!.address.hexEip55;
    final to = receivingAddressController.address.value;
    final fromAddress = EthereumAddress.fromHex(from);
    final toAddress = EthereumAddress.fromHex(to);

    await tokenController.refreshToken(true);
    final tokenDecimals = tokenController.decimals.value.toInt();
    final tokenBalance = tokenController.balance.value;
    final tokenMultiplier = BigInt.from(10).pow(tokenDecimals);

    final tokenAmount_ = tokenAmountController.data.value;
    final tokenAmountParts = tokenAmountController.data.value.split('.');
    BigInt tokenAmountPartA = BigInt.zero;
    BigInt tokenAmountPartB = BigInt.zero;
    tokenAmountPartA = BigInt.parse(tokenAmountParts[0]) * tokenMultiplier;
    if (tokenAmountParts.length > 1) {
      final tokenAmountPartBLength = tokenAmountParts[1].length;
      if (tokenDecimals <= tokenAmountPartBLength) {
        tokenAmountPartB =
            BigInt.parse(tokenAmountParts[1].substring(0, tokenDecimals));
      } else {
        tokenAmountPartB = BigInt.parse(tokenAmountParts[1]) *
            BigInt.from(10).pow(tokenDecimals - tokenAmountPartBLength);
      }
    }

    final tokenAmount = tokenAmountPartA + tokenAmountPartB;
    final sendAmount = EtherAmount.fromUnitAndValue(EtherUnit.wei, tokenAmount);
    final privateKey = EthPrivateKey.fromHex(account!.privateKey);
    final web3Client = Web3Client(network.rpcUrl, Client());
    final erc20 = WalletService.getERC20Token(
      contractAddress: token.address,
      rpcUrl: network.rpcUrl,
      chainId: chainId,
    );

    gasPrice = await web3Client.getGasPrice();

    if (!canSend.value) estimated.value = false;
    if (!estimated.value) {
      estimating.value = true;
      canSend.value = true;
      try {
        if (token.address.hexEip55 == OHOSettings.nativeTokenAddress) {
          estimatedGas = await web3Client.estimateGas(
            sender: fromAddress,
            to: toAddress,
            value: sendAmount,
          );
        } else {
          final transferData = erc20.self.function('transfer').encodeCall([
            toAddress,
            sendAmount.getInWei,
          ]);
          estimatedGas = await web3Client.estimateGas(
            sender: fromAddress,
            to: toAddress,
            data: transferData,
          );
        }
      } catch (error) {
        canSend.value = false;
        errorMessage = 'Token Balance is insufficient';
      }

      final estimatedFee_ = gasPrice.getInWei * estimatedGas;
      estimatedFee = estimatedFee_ / BigInt.from(10).pow(18);

      estimating.value = false;
      estimated.value = true;
      return;
    }

    // final hash = await web3Client.sendTransaction(
    //   privateKey,
    //   Transaction(
    //     from: fromAddress,
    //     to: toAddress,
    //     value: sendAmount,
    //     gasPrice: gasPrice,
    //   ),
    //   chainId: chainId,
    // );

    // final hash = await erc20.transfer(
    //   toAddress,
    //   sendAmount.getInWei,
    //   credentials: privateKey,
    //   transaction: Transaction(gasPrice: gasPrice),
    // );

    // print(hash);

    openTransactionDetailsScreen();

    walletService.updateTransaction(
      status: OHOTransactionStatus.sending,
      type: OHOTransactionType.sendToken,
      from: from,
      to: to,
      tokenAmount: double.parse(tokenAmount_),
      tokenDecimals: tokenDecimals > 12 ? 12 : tokenDecimals,
      tokenName: tokenName,
      network: network,
    );
  }
}

class TokenSendScreen extends BaseWidget<TokenSendScreenController> {
  TokenSendScreen({
    super.key,
    super.tag,
  }) : super(controller: TokenSendScreenController());

  Widget getTokenChip() {
    if (controller.accountKey.value != walletService.selectedAccount.value) {
      controller.accountKey.value = walletService.selectedAccount.value;
      controller.account = walletService.selectedAccountInstance;
      controller.receivingAddressController.address.value = '';
      controller.tokenRefreshing = true;
    }
    if (controller.token != null &&
        controller.token!.networkKey != walletService.selectedNetwork.value) {
      controller.tokenKey.value = '';
      controller.token = null;
      controller.tokenRefreshing = true;
    }
    final tokenRefreshing = controller.tokenRefreshing;
    if (tokenRefreshing) controller.tokenRefreshing = !tokenRefreshing;
    return OHOTokenChip(
      tag: TokenSendScreenController.tokenTag,
      tokenKey: controller.tokenKey.value,
      token: controller.token,
      getBackOnSelected: controller.onSelectedToken,
    )
      ..controller.token = controller.token
      ..controller.refreshToken(tokenRefreshing);
  }

  Widget get spinKitFadingCircle {
    return SpinKitFadingCircle(
      size: 100.sp,
      color: themeService.textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
              child: OHOAppBar02(),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  OHOHeaderText('Token Send'),
                  SizedBox(height: 50.h),
                  OHOText(
                    'Scan or paste the receiving address, or select it from your accounts or your contacts.',
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OHOText(
                        'Receiving Address',
                        fontSize: 60.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      OHOText(
                        ' *',
                        color: OHOColors.statusError,
                        fontSize: 60.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  OHOAccountAddressField(
                    tag: TokenSendScreenController.receivingAddressTag,
                    width: 700.w,
                    partLength: 8,
                  ),
                  SizedBox(height: 20.h),
                  OHOSolidButton(
                    width: 700.w,
                    height: 120.h,
                    title: 'Select from my Accounts',
                    fontSize: 50.sp,
                    onTap: () => Get.to(
                      () => AccountListScreen(
                        getBackOnSelected:
                            controller.onSelectedReceivingAccount,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  OHOSolidButton(
                    width: 700.w,
                    height: 120.h,
                    title: 'Select from my Contacts',
                    fontSize: 50.sp,
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OHOText(
                        'Token',
                        fontSize: 60.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      OHOText(
                        ' *',
                        color: OHOColors.statusError,
                        fontSize: 60.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  getTokenChip(),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: TokenSendScreenController.tokenAmountTag,
                    width: 700.w,
                    label: 'Token Amount',
                    required: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Token Amount is required',
                      ),
                    ],
                    inputFormatters: controller.tokenAmountFormatters,
                    onChanged: (data) {
                      if (!controller.estimated.value) return;
                      controller.estimated.value = false;
                    },
                  ),
                  !controller.estimating.value
                      ? Container()
                      : SizedBox(height: 100.h),
                  !controller.estimating.value
                      ? Container()
                      : spinKitFadingCircle,
                  !controller.estimated.value || !controller.canSend.value
                      ? Container()
                      : SizedBox(height: 100.h),
                  !controller.estimated.value || !controller.canSend.value
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OHOText('Gas Price:'),
                                  OHOText(
                                    '${controller.gasPrice.getValueInUnit(EtherUnit.gwei).toStringAsFixed(6)} Gwei',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OHOText('Estimated Gas:'),
                                  OHOText(controller.estimatedGas.toString()),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OHOText('Estimated Fee:'),
                                  OHOText(
                                    '${controller.estimatedFee.toStringAsFixed(6)} ${walletService.selectedNetworkInstance!.currencySymbol}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  controller.canSend.value
                      ? Container()
                      : SizedBox(height: 50.h),
                  controller.canSend.value
                      ? Container()
                      : SizedBox(
                    width: 700.w,
                        child: OHOMessage(
                            type: OHOMessageType.error,
                            message: controller.errorMessage,
                          )..controller.message.value = controller.errorMessage,
                      ),
                  SizedBox(height: 100.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OHOOutlinedButton(
                        width: 450.w,
                        title: 'Cancel',
                        onTap: () => Get.back(),
                      ),
                      OHOSolidButton(
                        width: 450.w,
                        title: !controller.estimated.value ||
                                !controller.canSend.value
                            ? 'Send'
                            : 'Confirm',
                        icon: Icon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: themeService.solidButtonTextColor,
                          size: 60.sp,
                        ),
                        onTap: () => controller.submit(),
                      ),
                    ],
                  ),
                  SizedBox(height: 1000.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}