import 'package:ohowallet/core/exports.dart';

class WelcomeScreenController extends BaseController {}

class WelcomeScreen extends BaseWidget<WelcomeScreenController> {
  WelcomeScreen({
    super.key,
  }) : super(controller: WelcomeScreenController());

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
                  OHOHeaderText('Welcome to'),
                  OHOWalletLogo(),
                  OHOText('A secure wallet\nfor all EVM compatible networks'),
                  OHOSolidButton(title: 'Get Started'),
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
