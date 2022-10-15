import 'package:ohowallet/core/exports.dart';

class CreateWallet03ScreenController extends BaseController {
  static const seedPhraseChipTag = 'seed-phrase-chip';
  static const seedPhraseTag = 'seed-phrase';

  late OHOSeedPhraseChipController seedPhraseChipController;
  late OHOSeedPhraseController seedPhraseController;

  void reset() {
    seedPhraseChipController =
        Get.find<OHOSeedPhraseChipController>(tag: seedPhraseChipTag);
    seedPhraseController =
        Get.find<OHOSeedPhraseController>(tag: seedPhraseTag);

    seedPhraseChipController.reset();
    seedPhraseController.reset();
  }

  Future<void> submit() async {
    seedPhraseController =
        Get.find<OHOSeedPhraseController>(tag: seedPhraseTag);

    if (seedPhraseController.seedPhrase.toString() !=
        walletService.setupSeedPhrase.toString()) {
      showToast(
        message: 'Your Seed Phrase confirmation is incorrect.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    await appDataService.setup();

    await walletService.init();
    await walletService.setup();

    Get.to(() => CreateWallet04Screen());
  }
}

class CreateWallet03Screen extends BaseWidget<CreateWallet03ScreenController> {
  CreateWallet03Screen({
    super.key,
  }) : super(controller: CreateWallet03ScreenController());

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
                  OHOSeedPhraseChip(
                    tag: CreateWallet03ScreenController.seedPhraseChipTag,
                    seedPhraseTag: CreateWallet03ScreenController.seedPhraseTag,
                    seedPhrase: walletService.setupSeedPhrase.toList()
                      ..shuffle(),
                  ),
                  OHOSeedPhrase(
                    tag: CreateWallet03ScreenController.seedPhraseTag,
                    seedPhrase: [for (int index = 0; index < 12; index++) ''],
                    hidden: false,
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OHOOutlinedButton(
                            width: 400.w,
                            title: 'Reset',
                            onTap: () => controller.reset(),
                          ),
                          OHOSolidButton(
                            width: 600.w,
                            title: 'Confirm',
                            onTap: () => controller.submit(),
                          ),
                        ],
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
