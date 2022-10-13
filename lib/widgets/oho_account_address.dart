import 'package:ohowallet/core/exports.dart';

class OHOAccountAddressController extends BaseController {
  var address = ''.obs;

  OHOAccountAddressController({
    required String address,
  }) : super() {
    this.address.value = address;
  }

  Future<void> launchAddress() async {
    final selectedNetwork = walletService.selectedNetworkInstance;
    if (selectedNetwork == null) return;
    final blockExplorerUrl = selectedNetwork.blockExplorerUrl;
    if (blockExplorerUrl == '') return;
    launchUrl(Uri.parse('$blockExplorerUrl/address/${address.value}'));
  }

  Future<void> copyAddress() async {
    await FlutterClipboard.copy(address.value);
    showToast(
      message: 'Your account address was copied to clipboard.',
      backgroundColor: OHOColors.statusSuccess,
    );
  }
}

class OHOAccountAddress extends BaseWidget<OHOAccountAddressController> {
  OHOAccountAddress({
    super.key,
    super.tag,
    required String address,
  }) : super(
          controller: OHOAccountAddressController(
            address: address,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 800.w,
        height: 100.h,
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
                width: 50.sp,
                height: 50.sp,
                color: themeService.textFieldBorderColor,
              ),
            ),
            SizedBox(
              width: 600.w,
              child: OHOText(
                WalletService.getShortHex(controller.address.value),
                softWrap: false,
                fontSize: 40.sp,
                overflow: TextOverflow.fade,
              ),
            ),
            GestureDetector(
              onTap: () => controller.copyAddress(),
              child: SvgPicture.asset(
                'assets/icons/copy.svg',
                width: 50.sp,
                height: 50.sp,
                color: themeService.textFieldBorderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
