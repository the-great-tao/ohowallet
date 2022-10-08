import 'package:ohowallet/core/exports.dart';

class CreateWallet01ScreenController extends BaseController {}

class CreateWallet01Screen extends BaseWidget<CreateWallet01ScreenController> {
  CreateWallet01Screen({
    super.key,
  }) : super(controller: CreateWallet01ScreenController());

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
                  OHOAppBar01(step: 1),
                  SizedBox(height: 50.r),
                  OHOHeaderText('Create Password'),
                  SizedBox(height: 50.r),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.r),
                    child: OHOText(
                      'This password will unlock your OHO Wallet only on this device.',
                    ),
                  ),
                  SizedBox(height: 50.r),
                  OHOTextField(
                    tag: 'new-password',
                    label: 'New Password',
                    description: 'Password must be at least 8 characters',
                    required: true,
                    obscureText: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Password is required',
                      ),
                      OHOTextFieldValidatorMinLength(
                        minLength: 8,
                        errorMessage: 'Password is too short',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.r),
                  OHOTextField(
                    tag: 'confirm-new-password',
                    label: 'Confirm New Password',
                    description: 'Password confirmation must be matched',
                    required: true,
                    obscureText: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Password confirmation is required',
                      ),
                      OHOTextFieldValidatorEqual(
                        tag: 'new-password',
                        errorMessage: 'Password confirmation is not matched',
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      OHOSolidButton(
                        title: 'Create Password',
                        onTap: () => Get.to(() => CreateWallet02Screen()),
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
