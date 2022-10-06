import 'package:ohowallet/core/exports.dart';

class WalletSetupScreenController extends BaseController {}

class WalletSetupScreen extends BaseWidget<WalletSetupScreenController> {
  WalletSetupScreen({
    super.key,
  }) : super(controller: WalletSetupScreenController());

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
              padding: EdgeInsets.all(100.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 50.h),
                  OHOWalletLogo(),
                  Column(
                    children: [
                      OHOHeaderText('Wallet Setup'),
                      SizedBox(height: 50.h),
                      OHOText('Import an exiting wallet or\ncreate a new one'),
                    ],
                  ),
                  Column(
                    children: [
                      OHOOutlinedButton(title: 'Import a Wallet'),
                      SizedBox(height: 50.h),
                      OHOSolidButton(title: 'Create a New Wallet'),
                    ],
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
