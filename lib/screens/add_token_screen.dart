import 'package:ohowallet/core/exports.dart';

class AddTokenScreenController extends BaseController {
  static const addressTag = 'address';
  static const nameTag = 'name';
  static const symbolTag = 'symbol';
  static const decimalsTag = 'decimals';
  static const iconUrlTag = 'iconUrl';

  var isEditing = true.obs;
  String? tokenKey;
  Token? token;

  AddTokenScreenController({
    bool isEditing = false,
    this.tokenKey,
    this.token,
  }) : super() {
    this.isEditing.value = isEditing;
  }

  late OHOTextFieldController addressController;
  late OHOTextFieldController nameController;
  late OHOTextFieldController symbolController;
  late OHOTextFieldController decimalsController;
  late OHOTextFieldController iconUrlController;

  @override
  void onReady() {
    super.onReady();
    addressController = Get.find<OHOTextFieldController>(tag: addressTag);
    nameController = Get.find<OHOTextFieldController>(tag: nameTag);
    symbolController = Get.find<OHOTextFieldController>(tag: symbolTag);
    decimalsController = Get.find<OHOTextFieldController>(tag: decimalsTag);
    iconUrlController = Get.find<OHOTextFieldController>(tag: iconUrlTag);
  }

  void clearTokenInfo() {
    nameController.data.value = '';
    symbolController.data.value = '';
    decimalsController.data.value = '';

    nameController.textEditingController.clear();
    symbolController.textEditingController.clear();
    decimalsController.textEditingController.clear();
  }

  Future<void> onAddressChanged(String address) async {
    final contractAddress = WalletService.isValidAddress(address);
    if (contractAddress == null) {
      clearTokenInfo();
      return;
    }

    final token = WalletService.getERC20Token(
      contractAddress: contractAddress,
      rpcUrl: walletService.selectedNetworkInstance!.rpcUrl,
      chainId: walletService.selectedNetworkInstance!.chainId.toInt(),
    );

    try {
      final tokenName = await token.name();
      final tokenSymbol = await token.symbol();
      final tokenDecimals = await token.decimals();

      nameController.data.value = tokenName;
      symbolController.data.value = tokenSymbol;
      decimalsController.data.value = tokenDecimals.toString();

      nameController.textEditingController.text = tokenName;
      symbolController.textEditingController.text = tokenSymbol;
      decimalsController.textEditingController.text = tokenDecimals.toString();
    } catch (error) {
      clearTokenInfo();
      showToast(
        message: 'Cannot get Token information. Please check your Network and Token configurations.',
        backgroundColor: OHOColors.statusError,
      );
    }
  }

  bool isValid() {
    var valid = true;
    valid &= addressController.isValid();
    valid &= nameController.isValid();
    valid &= symbolController.isValid();
    valid &= decimalsController.isValid();
    valid &= iconUrlController.isValid();

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

    // if (isEditing.value) {
    //   token?.name = nameController.data.value;
    //   token?.rpcUrl = rpcUrlController.data.value;
    //   token?.chainId = BigInt.parse(chainIdController.data.value);
    //   token?.currencySymbol = currencySymbolController.data.value;
    //   token?.blockExplorerUrl = blockExplorerUrlController.data.value;
    // } else {
    //   final token = Token(
    //     name: nameController.data.value,
    //     rpcUrl: rpcUrlController.data.value,
    //     chainId: BigInt.parse(chainIdController.data.value),
    //     currencySymbol: currencySymbolController.data.value,
    //     blockExplorerUrl: blockExplorerUrlController.data.value,
    //   );
    //   walletService.customTokens.value.tokens[const Uuid().v4()] = token;
    // }
    //
    // walletService.customTokens.refresh();
    // walletService.storeCustomTokens();

    Get.back();
  }

  Future<void> removeToken() async {
    if (!isEditing.value || tokenKey == null) return;

    // walletService.customTokens.value.tokens.remove(tokenKey);
    // walletService.customTokens.refresh();
    // walletService.storeCustomTokens();
    // if (walletService.selectedToken.value == tokenKey) {
    //   walletService.setSelectedToken('ethereum');
    // }

    Get.back();
  }
}

class AddTokenScreen extends BaseWidget<AddTokenScreenController> {
  AddTokenScreen({
    super.key,
    super.tag,
    bool isEditing = false,
    String? tokenKey,
    Token? token,
  }) : super(
          controller: AddTokenScreenController(
            isEditing: isEditing,
            tokenKey: tokenKey,
            token: token,
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
                  OHOHeaderText(
                    '${controller.isEditing.value ? 'Edit' : 'Add'} Token',
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddTokenScreenController.addressTag,
                    label: 'Contract Address',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.token?.address.hexEip55
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Contract Address is required',
                      ),
                      OHOTextFieldValidatorEthereumAddress(
                        errorMessage: 'Contract Address is invalid',
                      ),
                    ],
                    onChanged: (value) => controller.onAddressChanged(value),
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddTokenScreenController.nameTag,
                    label: 'Name',
                    required: true,
                    readOnly: true,
                    data: controller.isEditing.value
                        ? controller.token?.symbol
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Name is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddTokenScreenController.symbolTag,
                    label: 'Symbol',
                    required: true,
                    readOnly: true,
                    data: controller.isEditing.value
                        ? controller.token?.symbol
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Symbol is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddTokenScreenController.decimalsTag,
                    label: 'Decimals',
                    required: true,
                    readOnly: true,
                    data: controller.isEditing.value
                        ? controller.token?.decimals.toString()
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Decimals is required',
                      ),
                    ],
                    inputFormatters: numberFormatters,
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddTokenScreenController.iconUrlTag,
                    label: 'Icon URL',
                    data: controller.isEditing.value
                        ? controller.token?.iconUrl
                        : null,
                  ),
                  SizedBox(height: 100.h),
                  OHOSolidButton(
                    title:
                        '${controller.isEditing.value ? 'Save' : 'Add'} Token',
                    onTap: () => controller.submit(),
                  ),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 50.h),
                  !controller.isEditing.value
                      ? Container()
                      : OHOOutlinedButton(
                          title: 'Remove Token',
                          onTap: () => controller.removeToken(),
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
