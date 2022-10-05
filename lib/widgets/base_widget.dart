import 'package:ohowallet/core/exports.dart';

abstract class BaseController extends GetxController {
  late AppDataService appDataService;
  late WalletService walletService;
  late ThemeService themeService;

  BaseController() {
    appDataService = Get.find<AppDataService>();
    walletService = Get.find<WalletService>();
    themeService = Get.find<ThemeService>();
  }
}

abstract class BaseWidget<T extends BaseController> extends StatelessWidget {
  final String? tag;
  final T controller;

  BaseWidget({
    super.key,
    this.tag,
    required this.controller,
  }) {
    Get.put(controller, tag: tag);
  }

  AppDataService get appDataService => controller.appDataService;

  WalletService get walletService => controller.walletService;

  ThemeService get themeService => controller.themeService;

  @override
  Widget build(BuildContext context);
}
