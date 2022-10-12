import 'package:ohowallet/core/exports.dart';

abstract class BaseController extends GetxController {
  late AppDataService appDataService;
  late WalletService walletService;
  late ThemeService themeService;
  late OHOWalletService ohoWalletService;

  BaseController() {
    appDataService = Get.find<AppDataService>();
    walletService = Get.find<WalletService>();
    themeService = Get.find<ThemeService>();
    ohoWalletService = Get.find<OHOWalletService>();
  }
}

abstract class BaseWidget<T extends BaseController> extends StatelessWidget {
  final String? tag;
  late final T controller;

  BaseWidget({
    super.key,
    this.tag,
    required T controller,
  }) : controller = Get.put<T>(controller, tag: tag);

  AppDataService get appDataService => controller.appDataService;

  WalletService get walletService => controller.walletService;

  ThemeService get themeService => controller.themeService;

  OHOWalletService get ohoWalletService => controller.ohoWalletService;
}
