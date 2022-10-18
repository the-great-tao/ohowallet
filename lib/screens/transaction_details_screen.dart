import 'package:ohowallet/core/exports.dart';

class TransactionDetailsScreenController extends BaseController {
  var status_ = OHOTransactionStatus.none.obs;
  var type_ = OHOTransactionType.none.obs;
  var tokenAmount_ = ''.obs;
  var tokenId_ = ''.obs;
  var from_ = ''.obs;
  var to_ = ''.obs;
  var hash_ = ''.obs;
  var date_ = ''.obs;
  var gasUsed_ = ''.obs;
  var feeCharged_ = ''.obs;

  var statusText = 'None'.obs;
  var statusColor = Colors.black;
  var statusSpinKit = false.obs;
  var typeText = 'None'.obs;

  @override
  void onInit() {
    super.onInit();

    statusColor = themeService.textColor;
    walletService.onUpdateTransaction = onUpdateTransaction;

    ever(status_, (value) => onStatusChanged());
    ever(type_, (value) => onTypeChanged());
  }

  Future<void> resetData() async {
    status_.value = OHOTransactionStatus.none;
    type_.value = OHOTransactionType.none;
    tokenAmount_.value = '';
    tokenId_.value = '';
    from_.value = '';
    to_.value = '';
    hash_.value = '';
    date_.value = '';
    gasUsed_.value = '';
    feeCharged_.value = '';
  }

  void onStatusChanged() {
    switch (status_.value) {
      case OHOTransactionStatus.none:
        statusText.value = 'None';
        statusColor = themeService.textColor;
        statusSpinKit.value = false;
        break;
      case OHOTransactionStatus.sending:
        statusText.value = 'Sending';
        statusColor = themeService.textColor;
        statusSpinKit.value = true;
        break;
      case OHOTransactionStatus.pending:
        statusText.value = 'Pending';
        statusColor = themeService.textColor;
        statusSpinKit.value = true;
        break;
      case OHOTransactionStatus.successful:
        statusText.value = 'Successful';
        statusColor = OHOColors.statusSuccess;
        statusSpinKit.value = false;
        break;
      case OHOTransactionStatus.failed:
        statusText.value = 'Failed';
        statusColor = OHOColors.statusError;
        statusSpinKit.value = false;
        break;
    }
  }

  void onTypeChanged() {
    switch (type_.value) {
      case OHOTransactionType.none:
        typeText.value = 'None';
        break;
      case OHOTransactionType.swapToken:
        typeText.value = 'Swap Token';
        break;
      case OHOTransactionType.sendToken:
        typeText.value = 'Send Token';
        break;
      case OHOTransactionType.sendNFT:
        typeText.value = 'Send NFT';
        break;
    }
  }

  Future<void> onUpdateTransaction({
    OHOTransactionStatus? status,
    OHOTransactionType? type,
    double? tokenAmount,
    int? tokenDecimals,
    String? tokenName,
    BigInt? tokenId,
    String? from,
    String? to,
    String? hash,
    DateTime? date,
    BigInt? gasUsed,
    double? feeCharged,
    Network? network,
  }) async {
    if (status != null) {
      status_.value = status;
    }

    if (type != null) {
      type_.value = type;
    }

    if (tokenAmount != null && tokenDecimals != null && tokenName != null) {
      tokenAmount_.value = NumberFormat.currency(
        locale: 'en_US',
        name: tokenName,
        decimalDigits: tokenDecimals,
        customPattern: '#,###.# \u00a4',
      ).format(tokenAmount);
    }

    if (tokenId != null && tokenName != null) {
      tokenId_.value =
          '#${NumberFormat('000000000').format(tokenId.toInt())} $tokenName';
    }

    if (from != null) {
      from_.value = from;
    }

    if (to != null) {
      to_.value = to;
    }

    if (hash != null) {
      hash_.value = hash;
    }

    if (date != null) {
      var localDate = date.toLocal();
      var localDateA = DateFormat.yMMMMd('en_US').format(localDate);
      var localDateB = DateFormat.jm('en_US').format(localDate);
      date_.value = '$localDateA at $localDateB';
    }

    if (gasUsed != null) {
      gasUsed_.value =
          NumberFormat.decimalPattern('en_US').format(gasUsed.toInt());
    }

    if (feeCharged != null && network != null) {
      feeCharged_.value = NumberFormat.currency(
        locale: 'en_US',
        name: network.currencySymbol,
        decimalDigits: 6,
        customPattern: '#,###.# \u00a4',
      ).format(feeCharged);
    }
  }
}

class TransactionDetailsScreen
    extends BaseWidget<TransactionDetailsScreenController> {
  TransactionDetailsScreen({
    super.key,
    super.tag,
  }) : super(controller: TransactionDetailsScreenController());

  Widget get lineSeparator {
    return Divider(
      height: 10.h,
      thickness: 2.r,
      color: themeService.textColor,
    );
  }

  Widget get launchUrlIcon {
    return Icon(
      FontAwesomeIcons.arrowUpRightFromSquare,
      size: 50.sp,
      color: themeService.textColor,
    );
  }

  Widget get spinKitFadingCircle {
    return SpinKitFadingCircle(
      size: 60.sp,
      color: themeService.textColor,
    );
  }

  void launchAddressUrl(String address) {
    launchUrl(Uri.parse('https://polygonscan.com/tokentxns?a=$address'));
  }

  void launchTransactionUrl(String transactionHash) {
    launchUrl(Uri.parse('https://polygonscan.com/tx/$transactionHash'));
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(50.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        gradient: themeService.screenBackgroundGradient,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OHOHeaderText('Transaction Details'),
          Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('Status:'),
                  Obx(
                    () => Row(
                      children: [
                        OHOText(
                          controller.statusText.value,
                          fontWeight: FontWeight.w500,
                          color: controller.statusColor,
                        ),
                        !controller.statusSpinKit.value
                            ? Container()
                            : SizedBox(width: 20.w),
                        !controller.statusSpinKit.value
                            ? Container()
                            : spinKitFadingCircle,
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              lineSeparator,
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('Type:'),
                  Obx(
                    () => OHOText(
                      controller.typeText.value,
                      fontWeight: FontWeight.w500,
                      color: OHOColors.pink,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    String title;
                    switch (controller.type_.value) {
                      case OHOTransactionType.none:
                      case OHOTransactionType.swapToken:
                      case OHOTransactionType.sendToken:
                        title = 'Amount:';
                        break;
                      case OHOTransactionType.sendNFT:
                        title = 'NFT:';
                        break;
                    }
                    return OHOText(title);
                  }),
                  Obx(() {
                    String? value;
                    if (controller.tokenAmount_.value != '') {
                      value = controller.tokenAmount_.value;
                    }
                    if (controller.tokenId_.value != '') {
                      value = controller.tokenId_.value;
                    }
                    if (value == null || value == '') {
                      return spinKitFadingCircle;
                    }
                    return OHOText(
                      value,
                      fontWeight: FontWeight.w500,
                      color: OHOColors.green,
                    );
                  }),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('From:'),
                  Obx(
                    () => Row(
                      children: [
                        controller.from_.value == ''
                            ? spinKitFadingCircle
                            : OHOText(
                                WalletService.getShortHex(
                                  controller.from_.value,
                                  partLength: 6,
                                ),
                                fontWeight: FontWeight.w500,
                                color: themeService.textColor,
                              ),
                        controller.from_.value == ''
                            ? Container()
                            : SizedBox(width: 20.w),
                        controller.from_.value == ''
                            ? Container()
                            : GestureDetector(
                                onTap: () => launchAddressUrl(
                                  controller.from_.value,
                                ),
                                child: launchUrlIcon,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('To:'),
                  Obx(
                    () => Row(
                      children: [
                        controller.to_.value == ''
                            ? spinKitFadingCircle
                            : OHOText(
                                WalletService.getShortHex(
                                  controller.to_.value,
                                  partLength: 6,
                                ),
                                fontWeight: FontWeight.w500,
                                color: themeService.textColor,
                              ),
                        controller.to_.value == ''
                            ? Container()
                            : SizedBox(width: 20.w),
                        controller.to_.value == ''
                            ? Container()
                            : GestureDetector(
                                onTap: () => launchAddressUrl(
                                  controller.to_.value,
                                ),
                                child: launchUrlIcon,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              lineSeparator,
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('Hash:'),
                  Obx(
                    () => Row(
                      children: [
                        controller.hash_.value == ''
                            ? spinKitFadingCircle
                            : OHOText(
                                WalletService.getShortHex(
                                  controller.hash_.value,
                                  partLength: 6,
                                ),
                                fontWeight: FontWeight.w500,
                                color: themeService.textColor,
                              ),
                        controller.hash_.value == ''
                            ? Container()
                            : SizedBox(width: 20.w),
                        controller.hash_.value == ''
                            ? Container()
                            : GestureDetector(
                                onTap: () => launchTransactionUrl(
                                  controller.hash_.value,
                                ),
                                child: launchUrlIcon,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('Date:'),
                  Obx(
                    () => controller.date_.value == ''
                        ? spinKitFadingCircle
                        : OHOText(
                            controller.date_.value,
                            fontWeight: FontWeight.w500,
                            color: themeService.textColor,
                          ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('Gas Used:'),
                  Obx(
                    () => controller.gasUsed_.value == ''
                        ? spinKitFadingCircle
                        : OHOText(
                            controller.gasUsed_.value,
                            fontWeight: FontWeight.w500,
                            color: themeService.textColor,
                          ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OHOText('Fee Charged:'),
                  Obx(
                    () => controller.feeCharged_.value == ''
                        ? spinKitFadingCircle
                        : OHOText(
                            controller.feeCharged_.value,
                            fontWeight: FontWeight.w500,
                            color: themeService.textColor,
                          ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
          OHOSolidButton(
            title: 'OK',
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
