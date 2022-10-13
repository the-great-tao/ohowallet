import 'package:ohowallet/core/exports.dart';

class OHOHeaderTextController extends BaseController {}

class OHOHeaderText extends BaseWidget<OHOHeaderTextController> {
  final String data;
  final bool? softWrap;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;

  OHOHeaderText(
    this.data, {
    super.key,
    super.tag,
    this.softWrap,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.overflow,
  }) : super(controller: OHOHeaderTextController());

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      softWrap: softWrap ?? true,
      style: TextStyle(
        color: themeService.headerTextColor,
        fontFamily: 'Outfit',
        fontSize: fontSize ?? 80.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing ?? 3.sp,
        overflow: overflow ?? TextOverflow.visible,
      ),
    );
  }
}
