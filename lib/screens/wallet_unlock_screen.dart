import 'package:ohowallet/core/exports.dart';

class WalletUnlockScreenController extends BaseController {}

class WalletUnlockScreen extends BaseWidget<WalletUnlockScreenController> {
  WalletUnlockScreen({
    super.key,
  }) : super(controller: WalletUnlockScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Ink(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(50.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 50.r),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          OHOModeSwitch(),
                        ],
                      ),
                    ],
                  ),
                  OHOWalletLogo(),
                  SizedBox(height: 50.r),
                  OHOHeaderText('Welcome Back!'),
                  SizedBox(height: 50.r),
                  Column(
                    children: [
                      OHOTextField(
                        tag: 'wallet-password',
                        label: 'Wallet Password',
                        obscureText: true,
                      ),
                      SizedBox(height: 20.r),
                      OHOSolidButton(
                        title: 'Unlock',
                        onTap: () => Get.to(() => CreateWallet01Screen()),
                      ),
                      SizedBox(height: 20.r),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/face-id.svg',
                            width: 120.r,
                            height: 120.r,
                            color: themeService.outlinedButtonTextColor,
                          ),
                          SvgPicture.asset(
                            'assets/icons/touch-id.svg',
                            width: 120.r,
                            height: 120.r,
                            color: themeService.outlinedButtonTextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50.r),
                  Column(
                    children: [
                      OHOText(
                        'Can’t unlock wallet?',
                        color: themeService.headerTextColor,
                      ),
                      SizedBox(height: 20.r),
                      OHOText(
                        'You can erase your current wallet,\nand setup a new one.',
                      ),
                      SizedBox(height: 20.r),
                      OHOText(
                        'Erase Wallet',
                        color: themeService.outlinedButtonTextColor,
                        fontSize: 60.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  SizedBox(height: 50.r),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
