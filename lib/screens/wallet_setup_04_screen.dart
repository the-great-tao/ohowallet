import 'package:ohowallet/core/exports.dart';

class WalletSetup04ScreenController extends BaseController {}

class WalletSetup04Screen extends BaseWidget<WalletSetup04ScreenController> {
  WalletSetup04Screen({
    super.key,
  }) : super(controller: WalletSetup04ScreenController());

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
                  OHOAppBar01(step: 4),
                  SizedBox(height: 50.r),
                  OHOHeaderText('Congratulations!'),
                  SizedBox(height: 50.r),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.r),
                    child: OHOText(
                      'You’ve successfully created your wallet. Make sure to keep your seed phrase safe, and make a backup. You will need your seed phrase to import / restore your wallet in the future.',
                    ),
                  ),
                  SizedBox(height: 50.r),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.r),
                    child: OHOText(
                      'OHO Universal EVM Wallet cannot recover your wallet if you lose your seed phase. You can find your seed phrase in Settings > Security.',
                    ),
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
