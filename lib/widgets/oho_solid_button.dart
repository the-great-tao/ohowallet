import 'package:ohowallet/core/exports.dart';

class OHOSolidButtonController extends BaseController {}

class OHOSolidButton extends BaseWidget<OHOSolidButtonController> {
  final double? width;
  final double? height;
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;

  OHOSolidButton({
    super.key,
    super.tag,
    this.width,
    this.height,
    required this.title,
    this.icon,
    this.onTap,
  }) : super(controller: OHOSolidButtonController());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(9999),
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
        child: InkWell(
          focusColor: themeService.solidButtonHoverColor,
          hoverColor: themeService.solidButtonHoverColor,
          highlightColor: Colors.white10,
          splashColor: Colors.white10,
          borderRadius: BorderRadius.circular(9999),
          onTap: onTap ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              icon != null ? SizedBox(width: 10.w) : Container(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themeService.solidButtonTextColor,
                  fontFamily: 'Outfit',
                  fontSize: 60.sp,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
