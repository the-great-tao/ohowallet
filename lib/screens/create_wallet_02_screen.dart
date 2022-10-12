import 'package:ohowallet/core/exports.dart';

class CreateWallet02ScreenController extends BaseController {
  static const seedPhraseTag = 'seed-phrase-view';

  late OHOSeedPhraseController seedPhraseController;

  Future<void> submit() async {
    seedPhraseController =
        Get.find<OHOSeedPhraseController>(tag: seedPhraseTag);
    if (seedPhraseController.hidden.value) {
      showToast(
        message: 'Please view and write down your Seed Phrase.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    Get.to(() => CreateWallet03Screen());
  }
}

class CreateWallet02Screen extends BaseWidget<CreateWallet02ScreenController> {
  CreateWallet02Screen({
    super.key,
  }) : super(controller: CreateWallet02ScreenController());

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
                  SizedBox(height: 100.r),
                  OHOSeedPhrase(
                    tag: CreateWallet02ScreenController.seedPhraseTag,
                    seedPhrase: walletService.setupSeedPhrase,
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      OHOSolidButton(
                        title: 'Next',
                        onTap: () => controller.submit(),
                      ),
                      SizedBox(height: 50.r),
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
