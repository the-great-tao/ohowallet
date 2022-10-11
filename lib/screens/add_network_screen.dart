import 'package:ohowallet/core/exports.dart';

class AddNetworkScreenController extends BaseController {
  static const networkNameTag = 'network-name';
  static const rpcUrlTag = 'rpc-url';
  static const chainIdTag = 'chain-id';
  static const currencySymbolTag = 'currency-symbol';
  static const blockExplorerUrlTag = 'block-explorer-url';

  var isEditing = true.obs;
}

class AddNetworkScreen extends BaseWidget<AddNetworkScreenController> {
  AddNetworkScreen({
    super.key,
    super.tag,
  }) : super(controller: AddNetworkScreenController());

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
        body: Ink(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OHOHeaderText(
                      '${controller.isEditing.value ? 'Edit' : 'Add'} Network'),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.networkNameTag,
                    label: 'Network Name',
                    required: true,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Network Name is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.rpcUrlTag,
                    label: 'RPC URL',
                    required: true,
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
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Chain ID is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddNetworkScreenController.currencySymbolTag,
                    label: 'Currency Symbol',
                    required: true,
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
                  ),
                  SizedBox(height: 200.h),
                  OHOSolidButton(
                    title:
                        '${controller.isEditing.value ? 'Save' : 'Add'} Network',
                    onTap: () {},
                  ),
                  SizedBox(height: 500.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
