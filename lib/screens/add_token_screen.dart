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
        message:
            'Cannot get Token information. Please check your Network and Token configurations.',
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

    if (token?.address.hexEip55 == OHOSettings.nativeTokenAddress) {
      showToast(
        message: 'You cannot edit Native Token.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    final tokenAddress = EthereumAddress.fromHex(addressController.data.value);
    final tokenName = nameController.data.value;
    final tokenSymbol = symbolController.data.value;
    final tokenDecimals = int.parse(decimalsController.data.value);
    final tokenIconUrl = iconUrlController.data.value;

    if (isEditing.value) {
      token?.address = tokenAddress;
      token?.name = tokenName;
      token?.symbol = tokenSymbol;
      token?.decimals = tokenDecimals;
      token?.iconUrl = tokenIconUrl;
    } else {
      final networkKey = walletService.selectedNetwork.value;
      final tokenKey = '$networkKey-${tokenAddress.hexEip55}';
      final token = Token(
        networkKey: networkKey,
        address: tokenAddress,
        name: tokenName,
        symbol: tokenSymbol,
        decimals: tokenDecimals,
        iconUrl: tokenIconUrl,
      );
      final tokens = walletService.tokens.value.tokens;
      if (tokens[networkKey] == null) tokens[networkKey] = {};
      final networkTokens = tokens[networkKey];
      networkTokens![tokenKey] = token;
    }

    walletService.tokens.refresh();
    walletService.storeTokens();

    Get.back();
  }

  Future<void> removeToken() async {
    if (!isEditing.value || tokenKey == null) return;

    if (token?.address.hexEip55 == OHOSettings.nativeTokenAddress) {
      showToast(
        message: 'You cannot remove Native Token.',
        backgroundColor: OHOColors.statusError,
      );
      return;
    }

    final tokens = walletService.tokens.value.tokens;
    final networkTokens = tokens[walletService.selectedNetwork.value];
    if (networkTokens != null) {
      networkTokens.remove(tokenKey);
      walletService.tokens.refresh();
      await walletService.storeTokens();
    }

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
                  SizedBox(height: 50.h),
                  OHOHeaderText(
                    '${controller.isEditing.value ? 'Edit' : 'Import'} Token',
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
                        ? controller.token?.name
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
                        '${controller.isEditing.value ? 'Save' : 'Import'} Token',
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
