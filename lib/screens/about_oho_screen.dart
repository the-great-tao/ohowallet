import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/screens/contact_us_screen.dart';
import 'package:ohowallet/screens/faq_screen.dart';
import 'package:ohowallet/screens/privacy_policy_screen.dart';
import 'package:ohowallet/screens/security_privacy_screen.dart';
import 'package:ohowallet/screens/terms_of_use_screen.dart';
import 'package:ohowallet/widgets/oho_app_bar_02.dart';

class AboutOHOScreenController extends BaseController {
  var biometrics = true.obs;
  var understood = true.obs;
}

class AboutOHOScreen extends BaseWidget<AboutOHOScreenController> {
  AboutOHOScreen({
    super.key,
  }) : super(controller: AboutOHOScreenController());

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
              child: Column(
                children: [
                  OHOAppBar02(
                    namePage: 'About OHOWallet',
                    hasBackSign: false,
                  ),
                  Container(
                    child: Column(
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: [
                            ListTileAbout(
                              title: 'Privacy Policy',
                              screen: PrivacyPolicyScreen(),
                            ),
                            ListTileAbout(
                              title: 'Terms of Use',
                              screen: TermsOfUseScreen(),
                            ),
                            ListTileAbout(
                              title: 'FAQ',
                              screen: FAQScreen(),
                            ),
                            ListTileAbout(
                              title: 'Visit Our Website',
                              screen: SecurityPrivacyScreen(),
                            ),
                            ListTileAbout(
                              title: 'Contact Us',
                              screen: ContactUsScreen(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      OHOSolidButton(
                        title: 'Send',
                        onTap: () => Get.to(() => ContactUsScreen()),
                      ),
                      SizedBox(height: 50.r),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ListTileAboutController extends BaseController {
  var biometrics = true.obs;
  var understood = true.obs;
}

class ListTileAbout extends BaseWidget<ListTileAboutController> {
  final String? title;
  final Widget? screen;

  ListTileAbout({
    Key? key,
    this.title,
    this.screen,
  }) : super(controller: ListTileAboutController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return screen ?? ContactUsScreen();
            }),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? '',
                style: TextStyle(
                  color: OHOColors.blue5,
                  fontFamily: 'Outfit',
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.sp,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 50.sp,
                color: themeService.textColor,
              ),
            ],
          ),
        ),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 0,
          color: OHOColors.grey5,
        ),
      ],
    );
  }
}
