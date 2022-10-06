import 'package:ohowallet/core/exports.dart';

class OHOTextController extends BaseController {}

class OHOText extends BaseWidget<OHOTextController> {
  final String data;

  OHOText(
    this.data, {
    super.key,
    super.tag,
  }) : super(controller: OHOTextController());

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: themeService.textColor,
        fontFamily: 'Outfit',
        fontSize: 50.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: 2.sp,
      ),
    );
  }
}
