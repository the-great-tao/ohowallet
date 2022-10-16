import 'package:ohowallet/core/exports.dart';

class TokenSendScreenController extends BaseController {
  static const receivingAddressTag = 'receiving-address';
  static const tokenAmountTag = 'token-amount';

  var accountKey = ''.obs;
  Account? account;

  var tokenKey = ''.obs;
  Token? token;

  bool tokenRefreshing = false;

  late OHOAccountAddressFieldController receivingAddressController;

  @override
  void onInit() {
    super.onInit();
    accountKey.value = walletService.selectedAccount.value;
    account = walletService.selectedAccountInstance;
  }

  @override
  void onReady() {
    super.onReady();
    receivingAddressController =
        Get.find<OHOAccountAddressFieldController>(tag: receivingAddressTag);
  }

  void onSelectedToken(String tokenKey, Token token) {
    this.tokenKey.value = tokenKey;
    this.token = token;
    tokenRefreshing = true;
  }

  void onSelectedReceivingAccount(String accountKey, Account account) {
    if (account.address.hexEip55 ==
        walletService.selectedAccountInstance!.address.hexEip55) {
      showToast(
        message: 'You cannot send Token to your current selected Account',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }
    receivingAddressController.selectFromAccounts(account!.address.hexEip55);
  }
}

class TokenSendScreen extends BaseWidget<TokenSendScreenController> {
  TokenSendScreen({
    super.key,
    super.tag,
  }) : super(controller: TokenSendScreenController());

  Widget getTokenChip() {
    if (controller.accountKey.value != walletService.selectedAccount.value) {
      controller.accountKey.value = walletService.selectedAccount.value;
      controller.account = walletService.selectedAccountInstance;
      controller.receivingAddressController.address.value = '';
      controller.tokenRefreshing = true;
    }
    if (controller.token != null &&
        controller.token!.networkKey != walletService.selectedNetwork.value) {
      controller.tokenKey.value = '';
      controller.token = null;
      controller.tokenRefreshing = true;
    }
    final tokenRefreshing = controller.tokenRefreshing;
    if (tokenRefreshing) controller.tokenRefreshing = !tokenRefreshing;
    return OHOTokenChip(
      tokenKey: controller.tokenKey.value,
      token: controller.token,
      getBackOnSelected: controller.onSelectedToken,
    )
      ..controller.token = controller.token
      ..controller.refreshToken(tokenRefreshing);
  }

  @override
  Widget build(BuildContext context) {
    var numberFormatters = [
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
              child: OHOAppBar02(),
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
                  OHOHeaderText('Token Send'),
                  SizedBox(height: 50.h),
                  OHOText(
                    'Scan or paste the receiving address, or select it from your accounts or your contacts.',
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OHOText(
                        'Receiving Address',
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
                  OHOAccountAddressField(
                    tag: TokenSendScreenController.receivingAddressTag,
                    width: 700.w,
                    partLength: 8,
                  ),
                  SizedBox(height: 20.h),
                  OHOSolidButton(
                    width: 700.w,
                    height: 120.h,
                    title: 'Select from my Accounts',
                    fontSize: 50.sp,
                    onTap: () => Get.to(
                      () => AccountListScreen(
                        getBackOnSelected:
                            controller.onSelectedReceivingAccount,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  OHOSolidButton(
                    width: 700.w,
                    height: 120.h,
                    title: 'Select from my Contacts',
                    fontSize: 50.sp,
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OHOText(
                        'Token',
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
                    tag: TokenSendScreenController.tokenAmountTag,
                    width: 700.w,
                    label: 'Token Amount',
                    required: true,
                    inputFormatters: numberFormatters,
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
