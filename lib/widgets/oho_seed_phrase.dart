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
  final List<String> seedPhrase;

  OHOSeedPhraseController({
    required this.seedPhrase,
  }) : super();
}

class OHOSeedPhrase extends BaseWidget<OHOSeedPhraseController> {
  OHOSeedPhrase({
    super.key,
    required List<String> seedPhrase,
  }) : super(
          controller: OHOSeedPhraseController(
            seedPhrase: seedPhrase,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
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
          for (int index = 0; index < controller.seedPhrase.length; index++)
            OHOSeedPhraseItem(
              tag: 'seed-phrase-item-$index',
              order: index,
              content: controller.seedPhrase[index],
            ),
        ],
      ),
    );
  }
}
