import 'package:ohowallet/core/exports.dart';

class AddAccountScreenController extends BaseController {
  static const nameTag = 'name';
  static const mnemonicTag = 'mnemonic';
  static const privateKeyTag = 'private-key';
  static const addressTag = 'address';

  var isEditing = true.obs;
  String? accountKey;
  Account? account;

  AddAccountScreenController({
    bool isEditing = false,
    this.accountKey,
    this.account,
  }) : super() {
    this.isEditing.value = isEditing;
  }

  late OHOTextFieldController nameController;

  bool isValid() {
    nameController = Get.find<OHOTextFieldController>(tag: nameTag);

    var valid = true;
    valid &= nameController.isValid();

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

    if (isEditing.value) {
      account?.name = nameController.data.value;
    } else {
      final mnemonic = generateMnemonic();
      final privateKey = await WalletService.getPrivateKey(mnemonic);
      final address = await WalletService.getPublicKey(privateKey);
      final account = Account(
        name: nameController.data.value,
        mnemonic: mnemonic,
        privateKey: privateKey,
        address: address,
      );
      walletService.accounts.value.accounts[account.address.hexEip55] = account;
    }

    walletService.accounts.refresh();
    walletService.storeAccounts();

    Get.back();
  }

  Future<void> removeAccount() async {
    if (!isEditing.value || accountKey == null) return;

    walletService.accounts.value.accounts.remove(accountKey);
    walletService.accounts.refresh();
    walletService.storeAccounts();
    if (walletService.selectedAccount.value == accountKey) {
      walletService.setSelectedAccount('');
    }

    Get.back();
  }
}

class AddAccountScreen extends BaseWidget<AddAccountScreenController> {
  AddAccountScreen({
    super.key,
    super.tag,
    bool isEditing = false,
    String? accountKey,
    Account? account,
  }) : super(
          controller: AddAccountScreenController(
            isEditing: isEditing,
            accountKey: accountKey,
            account: account,
          ),
        );

  @override
  Widget build(BuildContext context) {
    var numberFormatters = [
      TextInputFormatter.withFunction((oldValue, newValue) {
        try {
          final text = newValue.text;
          if (text.isNotEmpty) BigInt.parse(text);
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
                  OHOHeaderText(
                    '${controller.isEditing.value ? 'Edit' : 'Add'} Account',
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddAccountScreenController.nameTag,
                    label: 'Name',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.account?.name
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Name is required',
                      ),
                    ],
                  ),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 50.h),
                  !controller.isEditing.value
                      ? Container()
                      : OHOTextField(
                          tag: AddAccountScreenController.addressTag,
                          label: 'Address',
                          readOnly: true,
                          data: controller.account!.address.hexEip55,
                        ),
                  SizedBox(height: 100.h),
                  OHOSolidButton(
                    title:
                        '${controller.isEditing.value ? 'Save' : 'Add'} Account',
                    onTap: () => controller.submit(),
                  ),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 100.h),
                  !controller.isEditing.value
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: OHOText(
                            'Below are your account\'s Seed Phrase and Private Key. They can be used to recover your account. Copy them or write them down on a paper, and keep them in a safe place. Make sure that no one is watching your screen.',
                          ),
                        ),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 100.h),
                  !controller.isEditing.value
                      ? Container()
                      : OHOTextField(
                          tag: AddAccountScreenController.mnemonicTag,
                          label: 'Seed Phrase',
                          readOnly: true,
                          obscureText: true,
                          data: controller.account?.mnemonic,
                        ),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 50.h),
                  !controller.isEditing.value
                      ? Container()
                      : OHOTextField(
                          tag: AddAccountScreenController.privateKeyTag,
                          label: 'Private Key',
                          readOnly: true,
                          obscureText: true,
                          data: controller.account?.privateKey,
                        ),
                  SizedBox(height: 100.h),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 50.h),
                  !controller.isEditing.value
                      ? Container()
                      : OHOOutlinedButton(
                          title: 'Remove Account',
                          onTap: () => controller.removeAccount(),
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
