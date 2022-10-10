import 'package:ohowallet/core/exports.dart';

class WalletUnlockScreenController extends BaseController {
  Future<void> eraseData() async {
    await appDataService.reset();
    Get.offAll(() => WelcomeScreen());
  }
}

class WalletUnlockScreen extends BaseWidget<WalletUnlockScreenController> {
  WalletUnlockScreen({
    super.key,
  }) : super(controller: WalletUnlockScreenController());

  Widget eraseWalletDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        vertical: 850.h,
        horizontal: 50.w,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(50.r)),
        child: Ink(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OHOText(
                'Are you sure to erase\nall of your data?',
                color: OHOColors.blue3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OHOOutlinedButton(
                    width: 400.w,
                    title: 'No',
                    onTap: () => Get.back(),
                  ),
                  OHOSolidButton(
                    width: 400.w,
                    title: 'Yes',
                    onTap: () => controller.eraseData(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                      GestureDetector(
                        child: OHOText(
                          'Erase Wallet',
                          color: themeService.outlinedButtonTextColor,
                          fontSize: 60.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        onTap: () => Get.dialog(eraseWalletDialog()),
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