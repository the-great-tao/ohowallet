import 'package:ohowallet/core/exports.dart';

class BiometricService extends GetxService {
  static const useBiometricsKey = 'appSettings-useBiometrics';

  late LocalAuthentication localAuthentication;
  List<BiometricType> availableBiometrics = [];
  bool hasBiometrics = false;

  Box? appDataBox;
  var useBiometrics = false.obs;

  bool get hasFaceId => availableBiometrics.contains(BiometricType.face);

  bool get hasTouchId =>
      availableBiometrics.contains(BiometricType.fingerprint) ||
      availableBiometrics.contains(BiometricType.strong);

  Future<BiometricService> init() async {
    try {
      localAuthentication = LocalAuthentication();
      hasBiometrics = await localAuthentication.isDeviceSupported();
      hasBiometrics &= await localAuthentication.canCheckBiometrics;
      if (hasBiometrics) {
        availableBiometrics =
            await localAuthentication.getAvailableBiometrics();
        hasBiometrics &=
            availableBiometrics.isNotEmpty && (hasFaceId || hasTouchId);
      }
    } catch (exception) {
      print('BiometricService.init() exception:');
      print(exception);
    }

    final appDataService = Get.find<AppDataService>();
    appDataBox = appDataService.appDataBox;
    if (appDataBox == null) return this;

    final useBiometrics_ = await appDataBox?.get(useBiometricsKey);
    if (useBiometrics_ != null) {
      useBiometrics.value = useBiometrics_;
    } else {
      await storeUseBiometrics();
    }

    return this;
  }

  Future<void> storeUseBiometrics() async {
    await appDataBox?.put(useBiometricsKey, useBiometrics.value);
  }
}
