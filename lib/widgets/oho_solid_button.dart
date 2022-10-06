import 'package:ohowallet/core/exports.dart';

class OHOSolidButtonController extends BaseController {
  var data = ''.obs;

  OHOSolidButtonController({
    required String text,
  }) : super() {
    data.value = text;
  }
}

class OHOSolidButton extends BaseWidget<OHOSolidButtonController> {
  double? width;
  double? height;

  OHOSolidButton({
    required String text,
    this.width,
    this.height,
    super.key,
    super.tag,
  }) : super(controller: OHOSolidButtonController(text: text));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 140.h,
      decoration: BoxDecoration(
        color: themeService.solidButtonBackgroundColor,
        border: Border.all(color: themeService.solidButtonBorderColor),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Center(
        child: Text(
          controller.data.value,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: themeService.solidButtonTextColor,
            fontFamily: 'Outfit',
            fontSize: 60.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.sp,
          ),
        ),
      ),
    );
  }
}
