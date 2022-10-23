import 'package:ohowallet/core/exports.dart';

class MainScreenController extends BaseController {
  var selectedIndex = 0.obs;
}

class MainScreen extends BaseWidget<MainScreenController> {
  MainScreen({
    super.key,
    super.tag,
  }) : super(controller: MainScreenController());

  Widget? getBody() {
    switch (controller.selectedIndex.value) {
      case 0:
        return WalletMainScreen();
      case 1:
        return CollectibleMainScreen();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 500.h,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 50.w,
                right: 50.w,
              ),
              child: OHOAppBar02(),
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: OHOBottomBar(
          margin: EdgeInsets.symmetric(
            vertical: 40.h,
            horizontal: 40.w,
          ),
          itemPadding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 60.w,
          ),
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          selectedItemColor: themeService.textColor,
          unselectedItemColor: themeService.bottomBarUnselectedItemColor,
          items: const [
            OHOBottomBarItem(
              icon: Icon(FontAwesomeIcons.wallet),
              title: Text("Wallet"),
            ),
            OHOBottomBarItem(
              icon: Icon(FontAwesomeIcons.images),
              title: Text("Collectibles"),
            ),
            OHOBottomBarItem(
              icon: Icon(FontAwesomeIcons.gear),
              title: Text("Settings"),
            ),
          ],
        ),
        body: getBody(),
      );
    });
  }
}
