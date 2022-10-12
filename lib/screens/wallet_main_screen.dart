import 'package:ohowallet/core/exports.dart';

class WalletMainScreenController extends BaseController {}

class WalletMainScreen extends BaseWidget<WalletMainScreenController> {
  WalletMainScreen({
    super.key,
    super.tag,
  }) : super(controller: WalletMainScreenController());

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
              padding: EdgeInsets.symmetric(
                vertical: 50.h,
                horizontal: 50.w,
              ),
              child: OHOAppBar02(),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OHOHeaderText('Balance'),
                  SizedBox(height: 50.h),
                  OHOHeaderText('Tokens'),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
