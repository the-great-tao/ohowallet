import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/screens/about_oho_screen.dart';
import 'package:ohowallet/widgets/oho_app_bar_02.dart';

class ContactUsScreenController extends BaseController {
  var biometrics = true.obs;
  var understood = true.obs;
}

class ContactUsScreen extends BaseWidget<ContactUsScreenController> {
  ContactUsScreen({
    super.key,
  }) : super(controller: ContactUsScreenController());

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
                  OHOAppBar02(namePage: 'Contact Us',),
                  SizedBox(height: 20.r),
                  OHOTextField(
                    tag: 'contact-name',
                    label: 'Name',
                    required: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Name is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.r),
                  OHOTextField(
                    tag: 'contact-email',
                    label: 'Email',
                    required: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Email is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.r),
                  OHOTextField(
                    tag: 'contact-message',
                    label: 'Message',
                    required: true,
                    maxLines: 10,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Message is required',
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      OHOSolidButton(
                        title: 'Send',
                        onTap: () => Get.to(() => AboutOHOScreen()),
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
