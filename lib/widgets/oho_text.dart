import 'package:ohowallet/core/exports.dart';

class OHOTextController extends BaseController {}

class OHOText extends BaseWidget<OHOTextController> {
  final String data;
  final double? fontSize;
  final double? letterSpacing;

  OHOText(
    this.data, {
    super.key,
    super.tag,
    this.fontSize,
    this.letterSpacing,
  }) : super(controller: OHOTextController());

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: themeService.textColor,
        fontFamily: 'Outfit',
        fontSize: fontSize ?? 50.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: letterSpacing ?? 2.sp,
      ),
    );
  }
}
