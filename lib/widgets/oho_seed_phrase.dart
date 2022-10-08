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
    super.tag,
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
        vertical: 10.h,
        horizontal: 50.w,
      ),
      decoration: BoxDecoration(
        color: themeService.textFieldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(9999)),
      ),
      child: Obx(
        () => OHOText(
          '${controller.order.value + 1}.  ${controller.content.value}',
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

class OHOSeedPhraseController extends BaseController {
  var hidden = true.obs;
  final List<String> seedPhrase;

  OHOSeedPhraseController({
    bool hidden = true,
    required this.seedPhrase,
  }) : super() {
    this.hidden.value = hidden;
  }
}

class OHOSeedPhrase extends BaseWidget<OHOSeedPhraseController> {
  OHOSeedPhrase({
    super.key,
    super.tag,
    bool hidden = true,
    required List<String> seedPhrase,
  }) : super(
          controller: OHOSeedPhraseController(
            hidden: hidden,
            seedPhrase: seedPhrase,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !controller.hidden.value
          ? Container(
              width: double.infinity,
              height: 700.h,
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
              height: 700.h,
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
                    width: 150.r,
                    height: 150.r,
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
