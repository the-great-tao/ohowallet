import 'package:ohowallet/core/exports.dart';

class OHOHeaderTextController extends BaseController {}

class OHOHeaderText extends BaseWidget<OHOHeaderTextController> {
  final String data;
  final double? fontSize;
  final double? letterSpacing;

  OHOHeaderText(
    this.data, {
    super.key,
    super.tag,
    this.fontSize,
    this.letterSpacing,
  }) : super(controller: OHOHeaderTextController());

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: themeService.headerTextColor,
        fontFamily: 'Outfit',
        fontSize: fontSize ?? 80.sp,
        fontWeight: FontWeight.normal,
        letterSpacing: letterSpacing ?? 3.sp,
      ),
    );
  }
}
