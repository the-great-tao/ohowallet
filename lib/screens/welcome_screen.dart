import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/screens/list_token_transfer_screen.dart';

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
                  OHOHeaderText(
                    'Welcome to',
                    fontSize: 120.sp,
                    letterSpacing: 4.sp,
                  ),
                  OHOWalletLogo(),
                  OHOText('A secure wallet\nfor all EVM compatible networks'),
                  Column(
                    children: [
                      OHOSolidButton(
                        title: 'Get Started',
                        onTap: () => Get.to(() => ListTokenTransferScreen()),
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
