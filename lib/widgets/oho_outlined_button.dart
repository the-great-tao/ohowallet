import 'package:ohowallet/core/exports.dart';

class OHOOutlinedButtonController extends BaseController {}

class OHOOutlinedButton extends BaseWidget<OHOOutlinedButtonController> {
  final double? width;
  final double? height;
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;

  OHOOutlinedButton({
    super.key,
    super.tag,
    this.width,
    this.height,
    required this.title,
    this.icon,
    this.onTap,
  }) : super(controller: OHOOutlinedButtonController());

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            icon == null ? Container() : SizedBox(width: 10.w),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themeService.outlinedButtonTextColor,
                fontFamily: 'Outfit',
                fontSize: 60.sp,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
