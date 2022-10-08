import 'package:ohowallet/core/exports.dart';

class OHOSeedPhraseItemController extends BaseController {
  var order = 0.obs;
  var content = ''.obs;

  OHOSeedPhraseItemController({
    required int order,
    required String content,
  }) : super() {
    this.order.value = order;
    this.content.value = content;
  }
}

class OHOSeedPhraseItem extends BaseWidget<OHOSeedPhraseItemController> {
  OHOSeedPhraseItem({
    super.key,
    required super.tag,
    required int order,
    required String content,
  }) : super(
          controller: OHOSeedPhraseItemController(
            order: order,
            content: content,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.w,
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 50.w,
      ),
      decoration: BoxDecoration(
        color: themeService.textFieldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(9999)),
      ),
      child: Obx(
        () => OHOText(
          '${controller.order.value + 1}. ${controller.content.value}',
          textAlign: TextAlign.left,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class OHOSeedPhraseController extends BaseController {
  final String tag;
  final List<String> seedPhrase;
  var hidden = true.obs;
  var currentIndex = 0;

  OHOSeedPhraseController({
    required this.tag,
    required this.seedPhrase,
    bool hidden = true,
  }) : super() {
    this.hidden.value = hidden;
  }

  void reset() {
    for (int index = 0; index < seedPhrase.length; index++) {
      final seedPhraseItemController =
          Get.find<OHOSeedPhraseItemController>(tag: '$tag-item-$index');
      seedPhraseItemController.content.value = '';
    }
    currentIndex = 0;
  }

  void insertPhrase(String phrase) {
    final seedPhraseItemController =
        Get.find<OHOSeedPhraseItemController>(tag: '$tag-item-$currentIndex');
    seedPhraseItemController.content.value = phrase;
    currentIndex++;
  }
}

class OHOSeedPhrase extends BaseWidget<OHOSeedPhraseController> {
  OHOSeedPhrase({
    super.key,
    required String tag,
    required List<String> seedPhrase,
    bool hidden = true,
  }) : super(
          tag: tag,
          controller: OHOSeedPhraseController(
            tag: tag,
            seedPhrase: seedPhrase,
            hidden: hidden,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !controller.hidden.value
          ? Container(
              width: double.infinity,
              height: 650.h,
              padding: EdgeInsets.all(30.r),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5.r,
                  color: themeService.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                spacing: 20.r,
                runSpacing: 20.r,
                children: [
                  for (int index = 0;
                      index < controller.seedPhrase.length;
                      index++)
                    OHOSeedPhraseItem(
                      tag: '$tag-item-$index',
                      order: index,
                      content: controller.seedPhrase[index],
                    ),
                ],
              ),
            )
          : Ink(
              width: double.infinity,
              height: 650.h,
              padding: EdgeInsets.all(30.r),
              decoration: BoxDecoration(
                color: themeService.solidButtonBackgroundColor,
                border: Border.all(
                  width: 5.r,
                  color: themeService.solidButtonBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  SvgPicture.asset(
                    'assets/icons/eye-2-slash.svg',
                    width: 100.r,
                    height: 100.r,
                    color: themeService.solidButtonTextColor,
                  ),
                  SizedBox(height: 50.h),
                  OHOText(
                    'Click View to see your Seed Phrase',
                    color: themeService.solidButtonTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(height: 50.h),
                  OHOText(
                    'Make sure that no one is watching your screen',
                    color: themeService.solidButtonTextColor,
                    fontSize: 40.sp,
                  ),
                  Expanded(child: Container()),
                  OHOOutlinedButton(
                    title: 'View',
                    icon: SvgPicture.asset(
                      'assets/icons/eye-2.svg',
                      width: 60.r,
                      height: 60.r,
                      color: themeService.outlinedButtonTextColor,
                    ),
                    onTap: () => controller.hidden.value = false,
                  ),
                ],
              ),
            ),
    );
  }
}
