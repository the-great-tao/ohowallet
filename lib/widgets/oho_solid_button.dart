import 'package:ohowallet/core/exports.dart';

class OHOSolidButtonController extends BaseController {
  var data = ''.obs;

  OHOSolidButtonController({
    required String title,
  }) : super() {
    data.value = title;
  }
}

class OHOSolidButton extends BaseWidget<OHOSolidButtonController> {
  double? width;
  double? height;
  VoidCallback? onTap;

  OHOSolidButton({
    super.key,
    super.tag,
    required String title,
    this.width,
    this.height,
    this.onTap,
  }) : super(controller: OHOSolidButtonController(title: title));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: themeService.solidButtonHoverColor,
      hoverColor: themeService.solidButtonHoverColor,
      highlightColor: Colors.white10,
      splashColor: Colors.white10,
      borderRadius: BorderRadius.circular(9999),
      onTap: onTap ?? () {},
      child: Ink(
        width: width ?? double.infinity,
        height: height ?? 140.h,
        decoration: BoxDecoration(
          color: themeService.solidButtonBackgroundColor,
          border: Border.all(
            width: 5.sp,
            color: themeService.solidButtonBorderColor,
          ),
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
      ),
    );
  }
}
