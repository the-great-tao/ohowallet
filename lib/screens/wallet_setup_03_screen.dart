import 'package:ohowallet/core/exports.dart';

class WalletSetup03ScreenController extends BaseController {}

class WalletSetup03Screen extends BaseWidget<WalletSetup03ScreenController> {
  WalletSetup03Screen({
    super.key,
  }) : super(controller: WalletSetup03ScreenController());

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
                children: [
                  OHOAppBar01(step: 3),
                  SizedBox(height: 50.r),
                  OHOHeaderText('Confirm Seed Phrase'),
                  SizedBox(height: 50.r),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.r),
                    child: OHOText(
                      'Select words in the numerical order to confirm your seed phrase.',
                    ),
                  ),
                  SizedBox(height: 50.r),
                  OHOSolidButton(
                    title: 'Next',
                    onTap: () => Get.to(() => WalletSetup04Screen()),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
