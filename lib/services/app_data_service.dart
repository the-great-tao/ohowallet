import 'package:ohowallet/core/exports.dart';

class AppDataService extends GetxService {
  static const hivePath = 'hive';

  late LocalAuthentication localAuthentication;
  late bool usableBiometrics;
  late List<BiometricType> availableBiometrics;
  late FlutterSecureStorage secureStorage;
  late String setupPassword;
  String? appDataKey;
  Box? appDataBox;

  Future<AppDataService> init() async {
    localAuthentication = LocalAuthentication();
    usableBiometrics = await localAuthentication.isDeviceSupported();
    usableBiometrics &= await localAuthentication.canCheckBiometrics;
    if (usableBiometrics) {
      availableBiometrics = await localAuthentication.getAvailableBiometrics();
      usableBiometrics &= availableBiometrics.isNotEmpty &&
          (availableBiometrics.contains(BiometricType.strong) ||
              availableBiometrics.contains(BiometricType.fingerprint) ||
              availableBiometrics.contains(BiometricType.face));
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
