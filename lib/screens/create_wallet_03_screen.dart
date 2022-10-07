import 'package:ohowallet/core/exports.dart';

class CreateWallet03ScreenController extends BaseController {}

class CreateWallet03Screen extends BaseWidget<CreateWallet03ScreenController> {
  CreateWallet03Screen({
    super.key,
  }) : super(controller: CreateWallet03ScreenController());

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
                  Expanded(child: Container()),
                  Column(
                    children: [
                      OHOSolidButton(
                        title: 'Next',
                        onTap: () => Get.to(() => CreateWallet04Screen()),
                      ),
                      SizedBox(height: 200.r),
                    ],
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