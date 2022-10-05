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
    await walletService.initialize(
      '7949eee83236104a1364244da4469f7aff1c6d45d174b7998fe4694aa675f921',
    );
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
      builder: (context) => const MyApp(),
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (BuildContext context, Widget? child) {
        if (devicePreviewEnabled) {
          return DevicePreview.appBuilder(context, child);
        }
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
