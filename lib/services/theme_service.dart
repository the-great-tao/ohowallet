import 'package:ohowallet/core/exports.dart';

class OHOColors {
  static const gold = Color(0xffd4af34);
  static const blue = Color(0xff0e8ca5);
  static const purple = Color(0xff7a6bb0);
  static const violet = Color(0xffb065a9);
  static const pink = Color(0xffec6572);
  static const peach = Color(0xffed8c79);
  static const green = Color(0xff7daa6a);

  static const gold2 = Color(0xffd4af37);
  static const gold3 = Color(0xffb29700);

  static const blue2 = Color(0xff24d5d3);
  static const blue3 = Color(0xff0d8ca5);
  static const blue4 = Color(0xff537eb3);
  static const blue5 = Color(0xff314d58);
  static const blue6 = Color(0xff273e46);
  static const blue65 = Color(0xff0c2d3c);
  static const blue9 = Color(0xff071320);

  static const blueGrey = Color(0xffc5d0d6);
  static const grey1 = Color(0xffe7e7e7);
  static const grey5 = Color(0xffa6a6a6);

  static const pink0 = Color(0xffeee1d8);

  static const red2 = Color(0xffe54c38);

  static const green3 = Color(0xff619a46);

  static const white = Color(0xffffffff);
  static const black10 = Color(0x10000000);

  // static const Color primaryPrimary = Color(0xFF310BE8);
  // static const Color primaryPrimary10 = Color(0x1A310BE8);
  //
  // static const Color neutralBlack = Color(0xFF09101D);
  // static const Color neutralNeutral1 = Color(0xFF2C3A4B);
  // static const Color neutralNeutral3 = Color(0xFF545D69);
  // static const Color neutralNeutral5 = Color(0xFF858C94);
  // static const Color neutralNeutral7 = Color(0xFFDADEE3);
  // static const Color neutralNeutral8 = Color(0xFFEBEEF2);
  // static const Color neutralNeutral9 = Color(0xFFF4F6F9);
  //
  // static const Color actionPrimaryDefault = Color(0xFF310BE8);
  // static const Color actionPrimaryDisabled = Color(0xFF9784F3);
  // static const Color actionPrimaryInverted = Color(0xFFFFFFFF);

  static const Color statusSuccess = Color(0xFF23A757);
  static const Color statusSuccessBackground = Color(0xFFEDF9F0);

  static const Color statusWarning = Color(0xFFB95000);
  static const Color statusWarningBackground = Color(0xFFFFF4EC);

  static const Color statusError = Color(0xFFDA1414);
  static const Color statusErrorBackground = Color(0xFFFEEFEF);

  static const Color statusInfo = Color(0xFF2E5AAC);
  static const Color statusInfoBackground = Color(0xFFEEF2FA);
}

class OHOGradients {
  static const lightScreenBackground = LinearGradient(
    colors: [
      OHOColors.blueGrey,
      OHOColors.pink0,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const darkScreenBackground = LinearGradient(
    colors: [
      OHOColors.blue6,
      OHOColors.blue65,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class ThemeService extends GetxService {
  var lightMode = true.obs;

  Future<ThemeService> init() async {
    return this;
  }

  void setLightMode() => lightMode.value = true;

  void setDarkMode() => lightMode.value = false;

  LinearGradient get screenBackgroundGradient => lightMode.value
      ? OHOGradients.lightScreenBackground
      : OHOGradients.darkScreenBackground;

  Color get textFieldBorderColor =>
      lightMode.value ? OHOColors.gold2 : OHOColors.gold2;

  Color get textFieldBackgroundColor =>
      lightMode.value ? OHOColors.white : OHOColors.blue9;

  Color get textFieldHintColor =>
      lightMode.value ? OHOColors.grey5 : OHOColors.grey5;

  Color get textColor => lightMode.value ? OHOColors.blue3 : OHOColors.blue2;

  Color get headerTextColor =>
      lightMode.value ? OHOColors.blue5 : OHOColors.white;

  Color get solidButtonTextColor =>
      lightMode.value ? OHOColors.white : OHOColors.white;

  Color get solidButtonBackgroundColor =>
      lightMode.value ? OHOColors.gold2 : OHOColors.gold2;

  Color get solidButtonBorderColor =>
      lightMode.value ? OHOColors.gold2 : OHOColors.gold2;

  Color get solidButtonHoverColor =>
      lightMode.value ? OHOColors.gold3 : OHOColors.gold3;

  Color get outlinedButtonTextColor =>
      lightMode.value ? OHOColors.gold2 : OHOColors.gold2;

  Color get outlinedButtonBackgroundColor =>
      lightMode.value ? OHOColors.white : OHOColors.white;

  Color get outlinedButtonBorderColor =>
      lightMode.value ? OHOColors.gold2 : OHOColors.gold2;

  Color get outlinedButtonHoverColor =>
      lightMode.value ? OHOColors.black10 : OHOColors.black10;
}
