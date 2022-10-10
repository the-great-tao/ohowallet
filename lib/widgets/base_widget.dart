import 'package:ohowallet/core/exports.dart';

abstract class BaseController extends GetxController {
  late BiometricService biometricService;
  late AppDataService appDataService;
  late WalletService walletService;
  late ThemeService themeService;

  BaseController() {
    biometricService = Get.find<BiometricService>();
    appDataService = Get.find<AppDataService>();
    walletService = Get.find<WalletService>();
    themeService = Get.find<ThemeService>();
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

  BiometricService get biometricService => controller.biometricService;

  AppDataService get appDataService => controller.appDataService;

  WalletService get walletService => controller.walletService;

  ThemeService get themeService => controller.themeService;
}
