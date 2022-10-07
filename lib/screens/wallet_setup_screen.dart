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
                  Column(
                    children: [
                      OHOHeaderText('Wallet Setup'),
                      SizedBox(height: 50.r),
                      OHOText('Import an exiting wallet\nor create a new one'),
                    ],
                  ),
                  Column(
                    children: [
                      OHOOutlinedButton(title: 'Import a Wallet'),
                      SizedBox(height: 50.r),
                      OHOSolidButton(
                        title: 'Create a New Wallet',
                        onTap: () => Get.to(() => CreateWallet01Screen()),
                      ),
                      SizedBox(height: 100.r),
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
