import 'package:ohowallet/core/exports.dart';

class TokenListScreenController extends BaseController {}

class TokenListScreen extends BaseWidget<TokenListScreenController> {
  TokenListScreen({
    super.key,
    super.tag,
  }) : super(controller: TokenListScreenController());

  Widget getAccountBalance() {
    if (walletService.selectedNetwork.value.isEmpty ||
        walletService.selectedAccount.value.isEmpty) return Container();
    return OHOAccountBalance()..controller.refreshBalance();
  }

  Widget getAccountAddress() {
    if (walletService.selectedAccount.value.isEmpty) return Container();
    return OHOAccountAddress()..controller.refreshAddress();
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
                            () => AccountReceiveScreen(
                              account: walletService.selectedAccountInstance!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    const Divider(color: OHOColors.grey5),
                    SizedBox(height: 50.h),
                    OHOTokenList(getBackOnSelected: false),
                    SizedBox(height: 1000.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
