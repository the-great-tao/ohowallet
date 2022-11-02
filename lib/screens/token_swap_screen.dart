import 'package:ohowallet/core/exports.dart';

class TokenSwapScreenController extends BaseController {
  static const tokenTag = 'token';
  static const tokenAmountTag = 'token-amount';

  var accountKey = ''.obs;
  Account? account;

  var tokenKey = ''.obs;
  Token? token;
  bool tokenRefreshing = false;

  late OHOTokenChipController tokenController;
  late OHOTextFieldController tokenAmountController;

  final tokenAmountFormatters = [
    TextInputFormatter.withFunction((oldValue, newValue) {
      try {
        final text = newValue.text;
        if (text.isNotEmpty) double.parse(text);
        return newValue;
      } catch (error) {
        return oldValue;
      }
    }),
  ];

  bool get sendNativeToken =>
      token?.address.hexEip55 == OHOSettings.nativeTokenAddress;

  @override
  void onInit() {
    super.onInit();
    accountKey.value = walletService.selectedAccount.value;
    account = walletService.selectedAccountInstance;
  }

  @override
  void onReady() {
    super.onReady();
    tokenController = Get.find<OHOTokenChipController>(tag: tokenTag);
    tokenAmountController =
        Get.find<OHOTextFieldController>(tag: tokenAmountTag);
  }

  void onSelectedToken(String tokenKey, Token token) {
    this.tokenKey.value = tokenKey;
    this.token = token;
    tokenRefreshing = true;
  }

  bool isValid() {
    var valid = true;
    valid &= tokenAmountController.isValid();

    return valid;
  }

  Future<void> submit() async {
    if (tokenController.token == null) {
      showToast(
        message: 'Please select Token.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    if (!isValid()) {
      showToast(
        message: 'Please check your input data.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }
  }
}

class TokenSwapScreen extends BaseWidget<TokenSwapScreenController> {
  TokenSwapScreen({
    super.key,
    super.tag,
  }) : super(controller: TokenSwapScreenController());

  Widget getTokenChip() {
    if (controller.accountKey.value != walletService.selectedAccount.value) {
      controller.accountKey.value = walletService.selectedAccount.value;
      controller.account = walletService.selectedAccountInstance;
      controller.tokenRefreshing = true;
    }
    if (controller.token != null &&
        controller.token!.networkKey != walletService.selectedNetwork.value) {
      controller.tokenKey.value = '';
      controller.token = null;
      controller.tokenRefreshing = true;
    }
    final tokenRefreshing = controller.tokenRefreshing;
    if (tokenRefreshing) {
      controller.tokenRefreshing = false;
    }
    return OHOTokenChip(
      tag: TokenSwapScreenController.tokenTag,
      tokenKey: controller.tokenKey.value,
      token: controller.token,
      getBackOnSelected: controller.onSelectedToken,
    )
      ..controller.token = controller.token
      ..controller.refreshToken(tokenRefreshing);
  }

  Widget get lineSeparator {
    return Divider(
      height: 10.h,
      thickness: 2.r,
      color: themeService.textColor,
    );
  }

  Widget get spinKitFadingCircle {
    return SpinKitFadingCircle(
      size: 100.sp,
      color: themeService.textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 500.h,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 50.w,
                right: 50.w,
              ),
              child: OHOAppBar02(hasBackButton: true),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  OHOHeaderText('Token Swap'),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OHOText(
                        'From',
                        fontSize: 60.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      OHOText(
                        ' *',
                        color: OHOColors.statusError,
                        fontSize: 60.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  getTokenChip(),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: TokenSwapScreenController.tokenAmountTag,
                    width: 700.w,
                    hint: 'From Amount',
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'From Amount is required',
                      ),
                    ],
                    inputFormatters: controller.tokenAmountFormatters,
                  ),
                  SizedBox(height: 100.h),
                  OHOSolidButton(
                    title: 'Swap',
                    icon: Icon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: themeService.solidButtonTextColor,
                      size: 60.sp,
                    ),
                    onTap: () => controller.submit(),
                  ),
                  SizedBox(height: 1000.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
