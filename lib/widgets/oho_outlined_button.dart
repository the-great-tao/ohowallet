import 'package:ohowallet/core/exports.dart';

class OHOOutlinedButtonController extends BaseController {
  var data = ''.obs;

  OHOOutlinedButtonController({
    required String title,
  }) : super() {
    data.value = title;
  }
}

class OHOOutlinedButton extends BaseWidget<OHOOutlinedButtonController> {
  double? width;
  double? height;
  VoidCallback? onTap;

  OHOOutlinedButton({
    super.key,
    super.tag,
    required String title,
    this.width,
    this.height,
    this.onTap,
  }) : super(controller: OHOOutlinedButtonController(title: title));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: themeService.outlinedButtonHoverColor,
      hoverColor: themeService.outlinedButtonHoverColor,
      highlightColor: OHOColors.black10,
      splashColor: OHOColors.black10,
      borderRadius: BorderRadius.circular(9999),
      onTap: onTap ?? () {},
      child: Ink(
        width: width ?? double.infinity,
        height: height ?? 140.h,
        decoration: BoxDecoration(
          color: themeService.outlinedButtonBackgroundColor,
          border: Border.all(
            width: 5.sp,
            color: themeService.outlinedButtonBorderColor,
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Center(
          child: Text(
            controller.data.value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: themeService.outlinedButtonTextColor,
              fontFamily: 'Outfit',
              fontSize: 60.sp,
              fontWeight: FontWeight.normal,
              letterSpacing: 2.sp,
            ),
          ),
        ),
      ),
    );
  }
}
