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
      lightMode.value ? OHOColors.gold3 : OHOColors.gold2;

  Color get textFieldBackgroundColor =>
      lightMode.value ? OHOColors.white : OHOColors.blue9;

  Color get textFieldHintColor =>
      lightMode.value ? OHOColors.grey5 : OHOColors.grey5;

  Color get textColor => lightMode.value ? OHOColors.blue3 : OHOColors.blue2;

  Color get headerTextColor =>
      lightMode.value ? OHOColors.blue5 : OHOColors.white;

  Color get statusSuccessColor =>
      lightMode.value ? OHOColors.green3 : OHOColors.green3;

  Color get statusErrorColor =>
      lightMode.value ? OHOColors.red2 : OHOColors.red2;
}
