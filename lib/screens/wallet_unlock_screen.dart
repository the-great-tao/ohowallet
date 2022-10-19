import 'package:ohowallet/core/exports.dart';

class WalletUnlockScreenController extends BaseController {
  static const walletPasswordTag = 'wallet-password';

  late OHOTextFieldController walletPasswordController;

  Future<void> submit() async {
    walletPasswordController =
        Get.find<OHOTextFieldController>(tag: walletPasswordTag);
    final password = walletPasswordController.data.value;
    if (!(await appDataService.checkPassword(password))) {
      showToast(
        message: 'Wallet Password is incorrect.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }
    Get.offAll(() => MainScreen());
  }

  Future<void> biometricAuthenticate() async {
    if (!biometricService.hasBiometrics) return;
    if (!await biometricService.localAuthentication.authenticate(
      localizedReason: 'Please authenticate to open your Wallet',
      options: const AuthenticationOptions(biometricOnly: true),
    )) {
      showToast(
        message: 'Biometric authentication is failed.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }
    Get.offAll(() => MainScreen());
  }

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
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          gradient: themeService.screenBackgroundGradient,
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OHOText(
                'Are you sure to erase\nall of your data?',
                color: themeService.textColor,
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

  Widget get faceIdButton => !biometricService.hasFaceId
      ? Container()
      : GestureDetector(
          onTap: () => controller.biometricAuthenticate(),
          child: SvgPicture.asset(
            'assets/icons/face-id.svg',
            width: 120.r,
            height: 120.r,
            color: themeService.outlinedButtonTextColor,
          ),
        );

  Widget get touchIdButton => !biometricService.hasTouchId
      ? Container()
      : GestureDetector(
          onTap: () => controller.biometricAuthenticate(),
          child: SvgPicture.asset(
            'assets/icons/touch-id.svg',
            width: 120.r,
            height: 120.r,
            color: themeService.outlinedButtonTextColor,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Container(
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
                        tag: WalletUnlockScreenController.walletPasswordTag,
                        label: 'Wallet Password',
                        obscureText: true,
                      ),
                      SizedBox(height: 20.r),
                      OHOSolidButton(
                        title: 'Unlock',
                        onTap: () => controller.submit(),
                      ),
                      !biometricService.hasBiometrics ||
                              !biometricService.useBiometrics.value
                          ? Container()
                          : SizedBox(height: 20.r),
                      !biometricService.hasBiometrics ||
                              !biometricService.useBiometrics.value
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                faceIdButton,
                                touchIdButton,
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
