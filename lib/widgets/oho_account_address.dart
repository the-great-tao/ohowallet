import 'package:ohowallet/core/exports.dart';

class OHOAccountAddressController extends BaseController {
  var address = ''.obs;

  Future<void> refreshAddress() async {
    final selectedAccount = walletService.selectedAccountInstance;
    if (selectedAccount == null) {
      address.value = '';
      return;
    }
    address.value = selectedAccount.address.hexEip55;
  }

  Future<void> launchAddress() async {
    final selectedNetwork = walletService.selectedNetworkInstance;
    if (selectedNetwork == null) return;
    final blockExplorerUrl = selectedNetwork.blockExplorerUrl;
    if (blockExplorerUrl.isEmpty) return;
    launchUrl(Uri.parse('$blockExplorerUrl/address/${address.value}'));
  }

  Future<void> copyAddress() async {
    await FlutterClipboard.copy(address.value);
    showToast(
      message: 'Account address was copied to clipboard.',
      backgroundColor: OHOColors.statusSuccess,
    );
  }
}

class OHOAccountAddress extends BaseWidget<OHOAccountAddressController> {
  final double? width;
  final int partLength;

  OHOAccountAddress({
    super.key,
    super.tag,
    this.width,
    this.partLength = 10,
  }) : super(controller: OHOAccountAddressController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: width ?? 800.w,
        height: 120.h,
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 30.w,
        ),
        decoration: BoxDecoration(
          color: themeService.textFieldBackgroundColor,
          border: Border.all(
            width: 5.r,
            color: themeService.textFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => controller.launchAddress(),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 60.sp,
                height: 60.sp,
                color: themeService.textFieldBorderColor,
              ),
            ),
            SizedBox(
              width: width == null ? 600.w : width! - 200.w,
              child: OHOText(
                WalletService.getShortHex(
                  controller.address.value,
                  partLength: partLength,
                ),
                softWrap: false,
                fontSize: 40.sp,
                overflow: TextOverflow.fade,
              ),
            ),
            GestureDetector(
              onTap: () => controller.copyAddress(),
              child: SvgPicture.asset(
                'assets/icons/copy.svg',
                width: 60.sp,
                height: 60.sp,
                color: themeService.textFieldBorderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
