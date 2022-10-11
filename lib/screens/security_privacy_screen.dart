import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/screens/about_oho_screen.dart';
import 'package:ohowallet/widgets/oho_app_bar_02.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SecurityPrivacyScreenController extends BaseController {
  var biometrics = true.obs;
  var selectedValue = 'Never'.obs;
  final List<String> items = [
    '30 seconds',
    '1 minute',
    '2 minute',
    '3 minute',
    '4 minute',
    '5 minute',
    'Never',
  ];

  void updateSelectedValue(String text) {
    selectedValue.value = text;
  }

  String? getSelectedValue() {
    return selectedValue.value;
  }
}

class SecurityPrivacyScreen
    extends BaseWidget<SecurityPrivacyScreenController> {
  SecurityPrivacyScreen({
    super.key,
  }) : super(controller: SecurityPrivacyScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Ink(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(50.r),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OHOAppBar02(
                      namePage: 'Security & Privacy',
                    ),
                    SizedBox(height: 20.r),
                    OHOText(
                      'Protect Your Wallet',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                    OHOSolidButton(title: 'Reveal Phrase'),
                    SizedBox(
                      height: 60.r,
                    ),
                    OHOText(
                      'Password',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                    OHOOutlinedButton(title: 'Change Password'),
                    SizedBox(
                      height: 60.r,
                    ),
                    OHOText(
                      'Auto Lock',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        items: controller.items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                    ),
                                    child: OHOText(
                                      item,
                                      color: OHOColors.blue5,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: controller.getSelectedValue(),
                        onChanged: (value) {
                          controller.updateSelectedValue(value!);
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: OHOColors.gold2,
                        ),
                        iconSize: 85.sp,
                        iconEnabledColor: Colors.yellow,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 130.h,
                        buttonWidth: double.infinity,
                        buttonPadding: EdgeInsets.only(left: 30.sp, right: 30.sp),
                        buttonDecoration: BoxDecoration(
                          color: themeService.outlinedButtonBackgroundColor,
                          border: Border.all(
                            width: 5.sp,
                            color: themeService.solidButtonBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(9999),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                        buttonElevation: 2,
                        itemHeight: 120.h,
                        dropdownMaxHeight: 600.h,
                        dropdownWidth: 1015.w,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.sp),
                          color: OHOColors.white,
                          border: Border.all(
                            width: 5.sp,
                            color: Colors.transparent,
                          ),
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: Radius.circular(45.sp),
                        scrollbarThickness: 10.w,
                        scrollbarAlwaysShow: true,
                        offset: Offset(7.w, 0),
                      ),
                    ),
                    SizedBox(
                      height: 60.r,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 50.r),
                          child: OHOText('Sign in with Biometrics?'),
                        ),
                        Expanded(child: Container()),
                        Obx(
                          () => FlutterSwitch(
                            activeColor:
                                themeService.solidButtonBackgroundColor,
                            value: controller.biometrics.value,
                            onToggle: (value) =>
                                controller.biometrics.value = value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60.r,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 50.r),
                          child: OHOText('Dark Mode'),
                        ),
                        Expanded(child: Container()),
                        FlutterSwitch(
                          activeColor: themeService.solidButtonBackgroundColor,
                          value: themeService.lightMode.value,
                          onToggle: (value) =>
                              themeService.lightMode.value = value,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
