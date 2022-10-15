import 'package:ohowallet/core/exports.dart';

class AddNetworkScreenController extends BaseController {
  static const nameTag = 'name';
  static const rpcUrlTag = 'rpc-url';
  static const chainIdTag = 'chain-id';
  static const currencySymbolTag = 'currency-symbol';
  static const blockExplorerUrlTag = 'block-explorer-url';

  var isEditing = true.obs;
  String? networkKey;
  Network? network;

  AddNetworkScreenController({
    bool isEditing = false,
    this.networkKey,
    this.network,
  }) : super() {
    this.isEditing.value = isEditing;
  }

  late OHOTextFieldController nameController;
  late OHOTextFieldController rpcUrlController;
  late OHOTextFieldController chainIdController;
  late OHOTextFieldController currencySymbolController;
  late OHOTextFieldController blockExplorerUrlController;

  @override
  void onReady() {
    super.onReady();
    nameController = Get.find<OHOTextFieldController>(tag: nameTag);
    rpcUrlController = Get.find<OHOTextFieldController>(tag: rpcUrlTag);
    chainIdController = Get.find<OHOTextFieldController>(tag: chainIdTag);
    currencySymbolController =
        Get.find<OHOTextFieldController>(tag: currencySymbolTag);
    blockExplorerUrlController =
        Get.find<OHOTextFieldController>(tag: blockExplorerUrlTag);
  }

  bool isValid() {
    var valid = true;
    valid &= nameController.isValid();
    valid &= rpcUrlController.isValid();
    valid &= chainIdController.isValid();
    valid &= currencySymbolController.isValid();
    valid &= blockExplorerUrlController.isValid();

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

    final networkName = nameController.data.value;
    final networkRpcUrl = rpcUrlController.data.value;
    final networkChainId = BigInt.parse(chainIdController.data.value);
    final networkCurrencySymbol = currencySymbolController.data.value;
    final networkBlockExplorerUrl = blockExplorerUrlController.data.value;

    if (isEditing.value) {
      network?.name = networkName;
      network?.rpcUrl = networkRpcUrl;
      network?.chainId = networkChainId;
      network?.currencySymbol = networkCurrencySymbol;
      network?.blockExplorerUrl = networkBlockExplorerUrl;
    } else {
      final network = Network(
        name: networkName,
        rpcUrl: networkRpcUrl,
        chainId: networkChainId,
        currencySymbol: networkCurrencySymbol,
        blockExplorerUrl: networkBlockExplorerUrl,
      );
      walletService.customNetworks.value.networks[const Uuid().v4()] = network;
    }

    walletService.customNetworks.refresh();
    walletService.storeCustomNetworks();

    Get.back();
  }

  Future<void> removeNetwork() async {
    if (!isEditing.value || networkKey == null) return;

    walletService.customNetworks.value.networks.remove(networkKey);
    walletService.customNetworks.refresh();
    await walletService.storeCustomNetworks();
    if (walletService.selectedNetwork.value == networkKey) {
      await walletService.setSelectedNetwork(OHOSettings.defaultNetworkKey);
    }

    Get.back();
  }
}

class AddNetworkScreen extends BaseWidget<AddNetworkScreenController> {
  AddNetworkScreen({
    super.key,
    super.tag,
    bool isEditing = false,
    String? networkKey,
    Network? network,
  }) : super(
          controller: AddNetworkScreenController(
            isEditing: isEditing,
            networkKey: networkKey,
            network: network,
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
                    '${controller.isEditing.value ? 'Edit' : 'Add'} Network',
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.nameTag,
                    label: 'Name',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.network?.name
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Name is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.rpcUrlTag,
                    label: 'RPC URL',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.network?.rpcUrl
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'RPC URL is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.chainIdTag,
                    label: 'Chain ID',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.network?.chainId.toString()
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Chain ID is required',
                      ),
                    ],
                    inputFormatters: numberFormatters,
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.currencySymbolTag,
                    label: 'Currency Symbol',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.network?.currencySymbol
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Currency Symbol is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.blockExplorerUrlTag,
                    label: 'Block Explorer URL',
                    data: controller.isEditing.value
                        ? controller.network?.blockExplorerUrl
                        : null,
                  ),
                  SizedBox(height: 100.h),
                  OHOSolidButton(
                    title:
                        '${controller.isEditing.value ? 'Save' : 'Add'} Network',
                    onTap: () => controller.submit(),
                  ),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 50.h),
                  !controller.isEditing.value
                      ? Container()
                      : OHOOutlinedButton(
                          title: 'Remove Network',
                          onTap: () => controller.removeNetwork(),
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
