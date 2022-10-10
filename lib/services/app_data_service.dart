import 'package:ohowallet/core/exports.dart';

class AppDataService extends GetxService {
  static const hivePath = 'hive';

  late LocalAuthentication localAuthentication;
  late bool hasBiometrics;
  late List<BiometricType> availableBiometrics;
  late FlutterSecureStorage secureStorage;
  late String setupPassword;
  String? appDataKey;
  Box? appDataBox;

  bool get hasFaceId => availableBiometrics.contains(BiometricType.face);

  bool get hasTouchId =>
      availableBiometrics.contains(BiometricType.fingerprint) ||
      availableBiometrics.contains(BiometricType.strong);

  Future<AppDataService> init() async {
    localAuthentication = LocalAuthentication();
    hasBiometrics = await localAuthentication.isDeviceSupported();
    hasBiometrics &= await localAuthentication.canCheckBiometrics;
    if (hasBiometrics) {
      availableBiometrics = await localAuthentication.getAvailableBiometrics();
      hasBiometrics &=
          availableBiometrics.isNotEmpty && (hasFaceId || hasTouchId);
    }

    secureStorage = const FlutterSecureStorage();

    appDataKey = await secureStorage.read(key: 'appDataKey');
    if (appDataKey == null) {
      return this;
    }

    await Hive.initFlutter('hive');
    appDataBox = await Hive.openBox(
      'appData',
      encryptionCipher: HiveAesCipher(hexToBytes(appDataKey!)),
    );

    return this;
  }

  Future<void> reset() async {
    await appDataBox?.deleteFromDisk();
    appDataBox = null;

    final appDirectory = await getApplicationDocumentsDirectory();
    final hiveDirectory =
        Directory('${appDirectory.path}/${AppDataService.hivePath}');
    if (await hiveDirectory.exists()) {
      await hiveDirectory.delete(recursive: true);
    }

    await secureStorage.deleteAll();
  }

  Future<void> setup() async {
    if (setupPassword.isEmpty) return;

    appDataKey = sha256.convert(utf8.encode(setupPassword)).toString();
    await secureStorage.write(
      key: 'appDataKey',
      value: appDataKey,
    );

    await Hive.initFlutter('hive');
    appDataBox = await Hive.openBox(
      'appData',
      encryptionCipher: HiveAesCipher(hexToBytes(appDataKey!)),
    );

    setupPassword = '';
  }

  Future<bool> checkPassword(String password) async {
    appDataKey = await secureStorage.read(key: 'appDataKey');
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    if (appDataKey != hashedPassword) return false;
    return true;
  }
}
