import 'package:ohowallet/core/exports.dart';

const devicePreviewEnabled = false;

Future<void> setupAppData() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
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
  await Hive.openBox(
    'appData',
    encryptionCipher: HiveAesCipher(appDataKey),
  );
}

Future<void> setupWallet() async {
  final appDataBox = Hive.box('appData');

  String? accountMnemonic = appDataBox.get('account_mnemonic');
  if (accountMnemonic == null) {
    accountMnemonic = generateMnemonic();
    await appDataBox.put('account_mnemonic', accountMnemonic);
  }
  print("accountMnemonic: $accountMnemonic");

  String? accountPrivateKey = appDataBox.get('account_private_key');
  if (accountPrivateKey == null) {
    accountPrivateKey = await WalletService.getPrivateKey(accountMnemonic);
    await appDataBox.put('account_private_key', accountPrivateKey);
  }
  print("accountPrivateKey: $accountPrivateKey");

  String? accountAddress = appDataBox.get('account_address');
  if (accountAddress == null) {
    accountAddress =
        (await WalletService.getPublicKey(accountPrivateKey)).hexEip55;
    await appDataBox.put('account_address', accountAddress);
  }
  print("accountAddress: $accountAddress");

  final walletService = Get.put(WalletService());

  if (kReleaseMode) {
    await walletService.initialize(accountPrivateKey);
  } else {
    await walletService.initialize(OHOSettings.testPrivateKey);
  }
}

Future<void> setupMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setupAppData();
  await setupWallet();
}

void runMyApp() {
  runApp(
    DevicePreview(
      enabled: devicePreviewEnabled,
      builder: (context) => ScreenUtilInit(
        designSize: const Size(1125, 2436),
        minTextAdapt: true,
        builder: (context, child) => const MyApp(),
      ),
    ),
  );
}

void main() async {
  if (!kReleaseMode) {
    await setupMyApp();
    runMyApp();
    return;
  }

  runZonedGuarded(
    () async {
      await setupMyApp();
      await SentryFlutter.init(
        (options) => options
          ..dsn = OHOSettings.sentryDSN
          ..tracesSampleRate = 1.0,
      );
      FlutterError.onError = (FlutterErrorDetails details) {
        Sentry.captureException(details.exception, stackTrace: details.stack);
      };
      runMyApp();
    },
    (Object error, StackTrace stack) {
      Sentry.captureException(error, stackTrace: stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OHO Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (BuildContext context, Widget? child) => devicePreviewEnabled
          ? DevicePreview.appBuilder(context, child)
          : MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            ),
    );
  }
}
