import 'package:ohowallet/core/exports.dart';

abstract class BaseController extends GetxController {
  late AppDataService appDataService;
  late WalletService walletService;
  late ThemeService themeService;
  late BiometricService biometricService;
  late IsarService isarService;

  BaseController() {
    appDataService = Get.find<AppDataService>();
    walletService = Get.find<WalletService>();
    themeService = Get.find<ThemeService>();
    biometricService = Get.find<BiometricService>();
    isarService = Get.find<IsarService>();
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

  BiometricService get biometricService => controller.biometricService;

  IsarService get isarService => controller.isarService;
}
