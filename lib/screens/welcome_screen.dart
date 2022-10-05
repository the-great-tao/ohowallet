import 'package:ohowallet/core/exports.dart';

class WelcomeScreenController extends BaseController {
  var content = 'Hello World!'.obs;
}

class WelcomeScreen extends BaseWidget<WelcomeScreenController> {
  WelcomeScreen({super.key}) : super(controller: WelcomeScreenController());

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
                child: Text(
                  controller.content.value,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 100.sp,
                    color: themeService.textNormalColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
