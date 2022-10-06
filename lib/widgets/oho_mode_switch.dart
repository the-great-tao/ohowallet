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
        inactiveColor: themeService.textFieldBackgroundColor,
        inactiveToggleColor: themeService.textColor,
        inactiveSwitchBorder: Border.all(color: themeService.textColor),
        inactiveToggleBorder: Border.all(color: themeService.textColor),
        activeColor: themeService.solidButtonBackgroundColor,
        activeSwitchBorder:
            Border.all(color: themeService.solidButtonBorderColor),
        activeToggleBorder:
            Border.all(color: themeService.solidButtonBorderColor),
        value: themeService.lightMode.value,
        onToggle: (value) => themeService.lightMode.value = value,
      ),
    );
  }
}
