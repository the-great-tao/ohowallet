import 'package:ohowallet/core/exports.dart';

class WalletMainScreenController extends BaseController {}

class WalletMainScreen extends BaseWidget<WalletMainScreenController> {
  WalletMainScreen({
    super.key,
    super.tag,
  }) : super(controller: WalletMainScreenController());

  Widget getAccountBalance() {
    if (walletService.selectedNetwork.value.isEmpty ||
        walletService.selectedAccount.value.isEmpty) return Container();
    return OHOAccountBalance()..controller.refreshBalance();
  }

  Widget getAccountAddress() {
    if (walletService.selectedAccount.value.isEmpty) return Container();
    return OHOAccountAddress(tag: 'account-address-main')
      ..controller.refreshAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
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
            onRefresh: () async => walletService.selectedAccount.refresh(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  getAccountBalance(),
                  SizedBox(height: 50.h),
                  getAccountAddress(),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OHOSolidButton(
                        width: 350.w,
                        height: 120.h,
                        title: 'Send',
                        fontSize: 50.sp,
                        icon: Icon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: themeService.solidButtonTextColor,
                          size: 50.sp,
                        ),
                        onTap: () => Get.to(() => TokenSendScreen()),
                      ),
                      OHOSolidButton(
                        width: 350.w,
                        height: 120.h,
                        title: 'Receive',
                        fontSize: 50.sp,
                        icon: Icon(
                          FontAwesomeIcons.circleDollarToSlot,
                          color: themeService.solidButtonTextColor,
                          size: 50.sp,
                        ),
                        onTap: () => Get.to(
                          () => TokenReceiveScreen(
                            account: walletService.selectedAccountInstance!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OHOSolidButton(
                        width: 350.w,
                        height: 120.h,
                        title: 'Swap',
                        fontSize: 50.sp,
                        icon: Icon(
                          FontAwesomeIcons.arrowRightArrowLeft,
                          color: themeService.solidButtonTextColor,
                          size: 50.sp,
                        ),
                      ),
                      OHOSolidButton(
                        width: 350.w,
                        height: 120.h,
                        title: 'History',
                        fontSize: 50.sp,
                        icon: Icon(
                          FontAwesomeIcons.clockRotateLeft,
                          color: themeService.solidButtonTextColor,
                          size: 50.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  const Divider(color: OHOColors.grey5),
                  SizedBox(height: 50.h),
                  OHOTokenList(
                    tag: 'token-list-main',
                    getBackOnSelected: (tokenKey, token) {},
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
