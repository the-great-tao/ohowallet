import 'package:ohowallet/core/exports.dart';

class TokenSendScreenController extends BaseController {
  static const receivingAddressTag = 'receiving-address';
  static const tokenTag = 'token';
  static const tokenAmountTag = 'token-amount';

  var accountKey = ''.obs;
  Account? account;

  var tokenKey = ''.obs;
  Token? token;

  bool tokenRefreshing = false;

  var transactionType = OHOTransactionType.sendToken;

  late OHOAccountAddressFieldController receivingAddressController;
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
    tokenController = Get.find<OHOTokenChipController>(tag: tokenTag);
    tokenAmountController =
        Get.find<OHOTextFieldController>(tag: tokenAmountTag);
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
    receivingAddressController.selectFromAccounts(account.address.hexEip55);
  }

  Future<void> openTransactionDetailsScreen() async {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          vertical: 250.h,
          horizontal: 50.w,
        ),
        child: TransactionDetailsScreen()..controller.resetData(),
      ),
    );
  }

  bool isValid() {
    var valid = true;
    valid &= tokenAmountController.isValid();

    return valid;
  }

  Future<void> submit() async {
    if (receivingAddressController.address.value.isEmpty) {
      showToast(
        message: 'Please enter Receiving Address.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    if (receivingAddressController.address.value ==
        walletService.selectedAccountInstance!.address.hexEip55) {
      showToast(
        message: 'You cannot send Token to your current selected Account',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

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

    final from = walletService.selectedAccountInstance!.address.hexEip55;
    final to = receivingAddressController.address.value;

    await tokenController.refreshToken(true);
    final tokenDecimals = tokenController.decimals.value.toInt();
    final tokenBalance = tokenController.balance.value.toInt();
    final tokenMultiplier = BigInt.from(10).pow(tokenDecimals).toInt();

    final tokenAmount_ = tokenAmountController.data.value;
    var tokenAmount = double.parse(tokenAmount_) * tokenMultiplier ~/ 1;
    if (tokenAmount > tokenBalance) {
      showToast(
        message: 'Token Balance is insufficient.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    openTransactionDetailsScreen();

    walletService.updateTransaction(
      status: OHOTransactionStatus.sending,
      type: transactionType,
      from: from,
      to: to,
      tokenAmount: double.parse(tokenAmount_),
      tokenDecimals: tokenDecimals > 12 ? 12 : tokenDecimals,
      tokenName: tokenController.token!.symbol,
    );
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
      tag: TokenSendScreenController.tokenTag,
      tokenKey: controller.tokenKey.value,
      token: controller.token,
      getBackOnSelected: controller.onSelectedToken,
    )
      ..controller.token = controller.token
      ..controller.refreshToken(tokenRefreshing);
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
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Token Amount is required',
                      ),
                    ],
                    inputFormatters: controller.tokenAmountFormatters,
                  ),
                  SizedBox(height: 100.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OHOOutlinedButton(
                        width: 450.w,
                        title: 'Cancel',
                        onTap: () => Get.back(),
                      ),
                      OHOSolidButton(
                        width: 450.w,
                        title: 'Send',
                        icon: Icon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: themeService.solidButtonTextColor,
                          size: 60.sp,
                        ),
                        onTap: () => controller.submit(),
                      ),
                    ],
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
