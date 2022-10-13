import 'package:ohowallet/core/exports.dart';

class MobileScannerScreenController extends GetxController {}

class MobileScannerScreen extends StatelessWidget {
  final RxString codeReceiver;

  final MobileScannerScreenController controller =
      Get.put(MobileScannerScreenController());

  MobileScannerScreen({
    Key? key,
    required this.codeReceiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (code, args) {
          if (code.rawValue == null) {
            showToast(
              message: 'Failed to scan code.',
              backgroundColor: OHOColors.statusError,
            );
            return;
          }
          codeReceiver.value = code.rawValue!;
          Get.back();
        },
      ),
    );
  }
}
