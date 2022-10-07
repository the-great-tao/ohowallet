import 'package:ohowallet/core/exports.dart';

class CreateWallet01ScreenController extends BaseController {}

class CreateWallet01Screen extends BaseWidget<CreateWallet01ScreenController> {
  CreateWallet01Screen({
    super.key,
  }) : super(controller: CreateWallet01ScreenController());

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
                  OHOAppBar01(step: 1),
                  SizedBox(height: 50.r),
                  OHOHeaderText('Create Password'),
                  SizedBox(height: 50.r),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.r),
                    child: OHOText(
                      'This password will unlock your OHO Wallet only on this device.',
                    ),
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      OHOSolidButton(
                        title: 'Next',
                        onTap: () => Get.to(() => CreateWallet02Screen()),
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
