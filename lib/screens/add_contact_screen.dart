import 'package:ohowallet/core/exports.dart';

class AddContactScreenController extends BaseController {
  static const nameTag = 'name';
  static const addressTag = 'address';

  var isEditing = true.obs;
  String? contactKey;
  Contact? contact;

  AddContactScreenController({
    bool isEditing = false,
    this.contactKey,
    this.contact,
  }) : super() {
    this.isEditing.value = isEditing;
  }

  late OHOTextFieldController nameController;
  late OHOTextFieldController addressController;

  @override
  void onReady() {
    super.onReady();
    nameController = Get.find<OHOTextFieldController>(tag: nameTag);
    addressController = Get.find<OHOTextFieldController>(tag: addressTag);
  }

  bool isValid() {
    var valid = true;
    valid &= nameController.isValid();
    valid &= addressController.isValid();

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

    final contactName = nameController.data.value;
    final contactAddress =
        EthereumAddress.fromHex(addressController.data.value);

    if (isEditing.value) {
      contact?.name = contactName;
      contact?.address = contactAddress;
    } else {
      final contactKey = contactAddress.hexEip55;
      final contact = Contact(
        name: contactName,
        address: contactAddress,
      );
      final contacts = walletService.contacts.value.contacts;
      contacts[contactKey] = contact;
    }

    walletService.contacts.refresh();
    walletService.storeContacts();

    Get.back();
  }

  Future<void> removeContact() async {
    if (!isEditing.value || contactKey == null) return;

    walletService.contacts.value.contacts.remove(contactKey);
    walletService.contacts.refresh();
    await walletService.storeContacts();

    Get.back();
  }
}

class AddContactScreen extends BaseWidget<AddContactScreenController> {
  AddContactScreen({
    super.key,
    super.tag,
    bool isEditing = false,
    String? contactKey,
    Contact? contact,
  }) : super(
          controller: AddContactScreenController(
            isEditing: isEditing,
            contactKey: contactKey,
            contact: contact,
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
                  OHOHeaderText(
                    '${controller.isEditing.value ? 'Edit' : 'Add'} Contact',
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddContactScreenController.nameTag,
                    label: 'Name',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.contact?.name
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Name is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  OHOTextField(
                    tag: AddContactScreenController.addressTag,
                    label: 'Address',
                    required: true,
                    data: controller.isEditing.value
                        ? controller.contact?.address.hexEip55
                        : null,
                    validators: [
                      OHOTextFieldValidatorRequired(
                        errorMessage: 'Address is required',
                      ),
                      OHOTextFieldValidatorEthereumAddress(
                        errorMessage: 'Address is invalid',
                      ),
                    ],
                  ),
                  SizedBox(height: 100.h),
                  OHOSolidButton(
                    title:
                        '${controller.isEditing.value ? 'Save' : 'Add'} Contact',
                    onTap: () => controller.submit(),
                  ),
                  !controller.isEditing.value
                      ? Container()
                      : SizedBox(height: 50.h),
                  !controller.isEditing.value
                      ? Container()
                      : OHOOutlinedButton(
                          title: 'Remove Contact',
                          onTap: () => controller.removeContact(),
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
