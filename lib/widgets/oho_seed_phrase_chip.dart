import 'package:ohowallet/core/exports.dart';

class OHOSeedPhraseChipItemController extends BaseController {
  final String seedPhraseTag;
  final String content;
  var selected = false.obs;

  OHOSeedPhraseChipItemController({
    required this.seedPhraseTag,
    required this.content,
  }) : super();

  void onSelected(value) {
    if (!selected.value) {
      selected.value = value;
      final seedPhraseController =
          Get.find<OHOSeedPhraseController>(tag: seedPhraseTag);
      seedPhraseController.insertPhrase(content);
    }
  }
}

class OHOSeedPhraseChipItem
    extends BaseWidget<OHOSeedPhraseChipItemController> {
  OHOSeedPhraseChipItem({
    super.key,
    required super.tag,
    required String seedPhraseTag,
    required String content,
  }) : super(
          controller: OHOSeedPhraseChipItemController(
            seedPhraseTag: seedPhraseTag,
            content: content,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Obx(
        () => FilterChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          pressElevation: 10.r,
          // shape: StadiumBorder(),
          label: SizedBox(
            width: double.infinity,
            child: Text(
              controller.content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.sp,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.normal,
                color: controller.selected.value
                    ? themeService.solidButtonTextColor
                    : themeService.textColor,
              ),
            ),
          ),
          backgroundColor: themeService.textFieldBackgroundColor,
          checkmarkColor: themeService.solidButtonTextColor,
          selectedColor: themeService.solidButtonBackgroundColor,
          selected: controller.selected.value,
          onSelected: (value) => controller.onSelected(value),
        ),
      ),
    );
  }
}

class OHOSeedPhraseChipController extends BaseController {
  final String tag;
  final List<String> seedPhrase;

  OHOSeedPhraseChipController({
    required this.tag,
    required this.seedPhrase,
  }) : super();

  void reset() {
    for (int index = 0; index < seedPhrase.length; index++) {
      final seedPhraseChipItemController =
          Get.find<OHOSeedPhraseChipItemController>(tag: '$tag-item-$index');
      seedPhraseChipItemController.selected.value = false;
    }
  }
}

class OHOSeedPhraseChip extends BaseWidget<OHOSeedPhraseChipController> {
  final String seedPhraseTag;

  OHOSeedPhraseChip({
    super.key,
    required String tag,
    required this.seedPhraseTag,
    required List<String> seedPhrase,
  }) : super(
          tag: tag,
          controller: OHOSeedPhraseChipController(
            tag: tag,
            seedPhrase: seedPhrase,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.r),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 20.r,
        runSpacing: 20.r,
        children: [
          for (int index = 0; index < controller.seedPhrase.length; index++)
            OHOSeedPhraseChipItem(
              tag: '$tag-item-$index',
              seedPhraseTag: seedPhraseTag,
              content: controller.seedPhrase[index],
            ),
        ],
      ),
    );
  }
}
