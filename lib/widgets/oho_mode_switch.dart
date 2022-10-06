import 'package:ohowallet/core/exports.dart';

class OHOModeSwitchController extends BaseController {}

class OHOModeSwitch extends BaseWidget<OHOModeSwitchController> {
  OHOModeSwitch({
    super.key,
    super.tag,
  }) : super(controller: OHOModeSwitchController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterSwitch(
        width: 120.r,
        height: 60.r,
        value: themeService.lightMode.value,
        onToggle: (value) => themeService.lightMode.value = value,
        activeColor: themeService.textFieldBackgroundColor,
        activeSwitchBorder: Border.all(
          width: 5.r,
          color: themeService.textColor,
        ),
        activeToggleBorder: Border.all(
          width: 5.r,
          color: themeService.textColor,
        ),
        inactiveColor: themeService.textFieldBackgroundColor,
        inactiveToggleColor: themeService.textColor,
        inactiveSwitchBorder: Border.all(
          width: 5.r,
          color: themeService.textColor,
        ),
        inactiveToggleBorder: Border.all(
          width: 5.r,
          color: themeService.textColor,
        ),
      ),
    );
  }
}
