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
      style: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 100.sp,
        color: themeService.textNormalColor,
      ),
    );
  }
}

class WelcomeScreenController extends BaseController {}

class WelcomeScreen extends BaseWidget<WelcomeScreenController> {
  WelcomeScreen({
    super.key,
  }) : super(controller: WelcomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: GestureDetector(
              onTap: themeService.lightMode.value
                  ? themeService.setDarkMode
                  : themeService.setLightMode,
              child: Center(
                child: OHOText('Hello World!'),
              ),
            ),
          ),
        ),
      );
    });
  }
}
