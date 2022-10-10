import 'package:ohowallet/core/exports.dart';

class BiometricService extends GetxService {
  late LocalAuthentication localAuthentication;
  bool hasBiometrics = false;
  List<BiometricType> availableBiometrics = [];

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

    return this;
  }
}
