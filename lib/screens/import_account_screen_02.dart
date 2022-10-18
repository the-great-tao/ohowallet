import 'package:ohowallet/core/exports.dart';

class ImportAccountScreen02Controller extends BaseController {
  static const nameTag = 'name';
  static const mnemonicTag = 'mnemonic';

  late OHOTextFieldController nameController;
  late OHOTextFieldController mnemonicController;

  @override
  void onReady() {
    super.onReady();
    nameController = Get.find<OHOTextFieldController>(tag: nameTag);
    mnemonicController = Get.find<OHOTextFieldController>(tag: mnemonicTag);
  }

  bool isValid() {
    var valid = true;
    valid &= nameController.isValid();
    valid &= mnemonicController.isValid();

    return valid;
  }

  Future<void> submit() async {
    if (!isValid()) {
      showToast(
        message: 'Please check your input data.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    final accountName = nameController.data.value;
    final accountMnemonic = mnemonicController.data.value;

    final privateKey = await WalletService.getPrivateKey(accountMnemonic);
    final address = await WalletService.getPublicKey(privateKey);
    final account = Account(
      name: accountName,
      mnemonic: accountMnemonic,
      privateKey: privateKey,
      address: address,
    );
    final accountKey = address.hexEip55;

    final accounts = walletService.accounts.value.accounts;
    if (accounts.containsKey(accountKey)) {
      showToast(
        message: 'Account already exists.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }
    accounts[accountKey] = account;

    walletService.accounts.refresh();
    walletService.storeAccounts();

    Get.back();
  }
}

class ImportAccountScreen02
    extends BaseWidget<ImportAccountScreen02Controller> {
  ImportAccountScreen02({
    super.key,
    super.tag,
  }) : super(controller: ImportAccountScreen02Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 300.h,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50.h,
                horizontal: 50.w,
              ),
              child: OHOAppBar01(step: 0),
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
                  OHOHeaderText('Import Account'),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: ImportAccountScreen02Controller.nameTag,
                    label: 'Name',
                    required: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Name is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: ImportAccountScreen02Controller.mnemonicTag,
                    label: 'Seed Phrase',
                    required: true,
                    obscureText: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Seed Phrase is required',
                      ),
                      OHOTextFieldValidatorSeedPhrase(
                        errorMessage: 'Seed Phrase must contain 12 words',
                      ),
                    ],
                  ),
                  SizedBox(height: 100.h),
                  OHOSolidButton(
                    title: 'Import Account',
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
