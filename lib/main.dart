import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/services/app_data_service.dart';

const devicePreviewEnabled = false;

Future<void> setupMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Get.putAsync(() => BiometricService().init());
  await Get.putAsync(() => AppDataService().init());
  await Get.putAsync(() => WalletService().init());
  await Get.putAsync(() => ThemeService().init());
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
    final appDataService = Get.find<AppDataService>();

    return GetMaterialApp(
      title: 'OHO Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: appDataService.appDataBox == null
          ? WelcomeScreen()
          : WalletUnlockScreen(),
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
