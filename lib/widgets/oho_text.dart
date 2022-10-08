import 'package:ohowallet/core/exports.dart';

class OHOTextController extends BaseController {}

class OHOText extends BaseWidget<OHOTextController> {
  final String data;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  OHOText(
    this.data, {
    super.key,
    super.tag,
    this.textAlign,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
  }) : super(controller: OHOTextController());

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        color: color ?? themeService.textColor,
        fontFamily: 'Outfit',
        fontSize: fontSize ?? 50.sp,
        fontWeight: fontWeight ?? FontWeight.w300,
        letterSpacing: letterSpacing ?? 2.sp,
      ),
    );
  }
}
