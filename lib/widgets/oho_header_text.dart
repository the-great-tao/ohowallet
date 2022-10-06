import 'package:ohowallet/core/exports.dart';

class OHOHeaderTextController extends BaseController {}

class OHOHeaderText extends BaseWidget<OHOHeaderTextController> {
  final String data;

  OHOHeaderText(
    this.data, {
    super.key,
    super.tag,
  }) : super(controller: OHOHeaderTextController());

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: themeService.headerTextColor,
        fontFamily: 'Outfit',
        fontSize: 110.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 4.sp,
      ),
    );
  }
}
