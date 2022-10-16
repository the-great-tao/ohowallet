import 'package:ohowallet/core/exports.dart';

enum OHOAccountAddressFieldAction {
  none,
  scan,
  paste,
  selectFromAccounts,
  selectFromContacts
}

class OHOAccountAddressFieldController extends BaseController {
  var action = OHOAccountAddressFieldAction.none.obs;
  var address = ''.obs;
  EthereumAddress? _address;

  @override
  void onInit() {
    super.onInit();
    ever(address, (value) => onAddressChanged());
  }

  Future<void> onAddressChanged() async {
    if (address.value.isEmpty) return;
    _address = WalletService.isValidAddress(address.value);

    if (_address == null) {
      showToast(
        message: 'Receiving address is invalid.',
        backgroundColor: OHOColors.statusError,
      );
      address.value = '';
      return;
    }

    var message = '';
    switch (action.value) {
      case OHOAccountAddressFieldAction.none:
        // TODO: Handle this case.
        break;
      case OHOAccountAddressFieldAction.scan:
        message = 'Account Address was scanned from QR code.';
        break;
      case OHOAccountAddressFieldAction.paste:
        message = 'Account Address was pasted from clipboard.';
        break;
      case OHOAccountAddressFieldAction.selectFromAccounts:
        message = 'Account Address was selected from your Accounts.';
        break;
      case OHOAccountAddressFieldAction.selectFromContacts:
        message = 'Account Address was selected from your Contacts.';
        break;
    }

    showToast(
      message: message,
      backgroundColor: OHOColors.statusSuccess,
    );
  }

  Future<void> scanAddress() async {
    action.value = OHOAccountAddressFieldAction.scan;
    Get.to(() => MobileScannerScreen(codeReceiver: address));
  }

  Future<void> pasteAddress() async {
    action.value = OHOAccountAddressFieldAction.paste;
    address.value = await FlutterClipboard.paste();
  }

  Future<void> selectFromAccounts(String address) async {
    action.value = OHOAccountAddressFieldAction.selectFromAccounts;
    this.address.value = address;
  }

  Future<void> selectFromContacts(String address) async {
    action.value = OHOAccountAddressFieldAction.selectFromContacts;
    this.address.value = address;
  }
}

class OHOAccountAddressField
    extends BaseWidget<OHOAccountAddressFieldController> {
  final double? width;
  final int partLength;

  OHOAccountAddressField({
    super.key,
    super.tag,
    this.width,
    this.partLength = 10,
  }) : super(controller: OHOAccountAddressFieldController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: width ?? 800.w,
        height: 120.h,
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 30.w,
        ),
        decoration: BoxDecoration(
          color: themeService.textFieldBackgroundColor,
          border: Border.all(
            width: 5.r,
            color: themeService.textFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => controller.scanAddress(),
              child: SvgPicture.asset(
                'assets/icons/scan.svg',
                width: 60.sp,
                height: 60.sp,
                color: themeService.textFieldBorderColor,
              ),
            ),
            SizedBox(
              width: width == null ? 600.w : width! - 200.w,
              child: OHOText(
                controller.address.value.isEmpty
                    ? ''
                    : WalletService.getShortHex(
                        controller.address.value,
                        partLength: partLength,
                      ),
                softWrap: false,
                fontSize: 40.sp,
                overflow: TextOverflow.fade,
              ),
            ),
            GestureDetector(
              onTap: () => controller.pasteAddress(),
              child: SvgPicture.asset(
                'assets/icons/paste.svg',
                width: 60.sp,
                height: 60.sp,
                color: themeService.textFieldBorderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
