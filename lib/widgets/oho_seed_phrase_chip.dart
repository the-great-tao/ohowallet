import 'package:ohowallet/core/exports.dart';

class OHOSeedPhraseChipItemController extends BaseController {
  final selected = false.obs;
}

class OHOSeedPhraseChipItem
    extends BaseWidget<OHOSeedPhraseChipItemController> {
  final String content;

  OHOSeedPhraseChipItem({
    super.key,
    required super.tag,
    required this.content,
  }) : super(
          controller: OHOSeedPhraseChipItemController(),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 90.h,
      child: Obx(
        () => FilterChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          pressElevation: 10.r,
          shape: StadiumBorder(
            side: BorderSide(
              width: 5.r,
              color: themeService.solidButtonBorderColor,
            ),
          ),
          label: SizedBox(
            width: double.infinity,
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.sp,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.normal,
                color: controller.selected.value
                    ? themeService.solidButtonTextColor
                    : themeService.outlinedButtonTextColor,
              ),
            ),
          ),
          backgroundColor: themeService.textFieldBackgroundColor,
          checkmarkColor: themeService.solidButtonTextColor,
          selectedColor: themeService.solidButtonBackgroundColor,
          selected: controller.selected.value,
          onSelected: (value) {
            if (!controller.selected.value) {
              controller.selected.value = value;
            }
          },
        ),
      ),
    );
  }
}

class OHOSeedPhraseChipController extends BaseController {
  final List<String> seedPhrase;

  OHOSeedPhraseChipController({
    required this.seedPhrase,
  }) : super();
}

class OHOSeedPhraseChip extends BaseWidget<OHOSeedPhraseChipController> {
  OHOSeedPhraseChip({
    super.key,
    required super.tag,
    required List<String> seedPhrase,
  }) : super(
          controller: OHOSeedPhraseChipController(
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
              content: controller.seedPhrase[index],
            ),
        ],
      ),
    );
  }
}
