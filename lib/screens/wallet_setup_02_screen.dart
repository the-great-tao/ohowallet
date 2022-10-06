import 'package:ohowallet/core/exports.dart';

class WalletSetup02ScreenController extends BaseController {}

class WalletSetup02Screen extends BaseWidget<WalletSetup02ScreenController> {
  WalletSetup02Screen({
    super.key,
  }) : super(controller: WalletSetup02ScreenController());

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
                  OHOAppBar01(step: 2),
                  SizedBox(height: 50.r),
                  OHOHeaderText('Write down Seed Phrase'),
                  SizedBox(height: 50.r),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.r),
                    child: OHOText(
                      'Below is your seed phrase. Write it down on a paper, and keep it in a safe place. You will be asked to reenter this phrase in numerical order in the next step.',
                    ),
                  ),
                  SizedBox(height: 50.r),
                  OHOSolidButton(
                    title: 'Next',
                    onTap: () => Get.to(() => WalletSetup03Screen()),
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
