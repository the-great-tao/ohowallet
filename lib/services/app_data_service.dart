import 'package:ohowallet/core/exports.dart';

class AppDataService extends GetxService {
  late FlutterSecureStorage secureStorage;
  late Box appDataBox;

  Future<AppDataService> init() async {
    secureStorage = const FlutterSecureStorage();

    final String? appDataKey_ = await secureStorage.read(key: 'appDataKey');
    List<int> appDataKey;

    if (appDataKey_ != null) {
      appDataKey = List<int>.from(jsonDecode(appDataKey_));
    } else {
      appDataKey = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'appDataKey',
        value: jsonEncode(appDataKey),
      );
    }

    await Hive.initFlutter('hive');
    appDataBox = await Hive.openBox(
      'appData',
      encryptionCipher: HiveAesCipher(appDataKey),
    );

    return this;
  }
}
