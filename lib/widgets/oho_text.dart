import 'package:ohowallet/core/exports.dart';

class OHOTextController extends BaseController {}

class OHOText extends BaseWidget<OHOTextController> {
  final String data;
  final TextAlign? textAlign;
  final bool? softWrap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;

  OHOText(
    this.data, {
    super.key,
    super.tag,
    this.textAlign,
    this.softWrap,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.overflow,
  }) : super(controller: OHOTextController());

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign ?? TextAlign.center,
      softWrap: softWrap ?? true,
      style: TextStyle(
        color: color ?? themeService.textColor,
        fontFamily: 'Outfit',
        fontSize: fontSize ?? 50.sp,
        fontWeight: fontWeight ?? FontWeight.w300,
        letterSpacing: letterSpacing ?? 2.sp,
        overflow: overflow ?? TextOverflow.visible,
      ),
    );
  }
}
