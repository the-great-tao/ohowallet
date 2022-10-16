import 'package:ohowallet/core/exports.dart';

class TokenListScreenController extends BaseController {}

class TokenListScreen extends BaseWidget<TokenListScreenController> {
  TokenListScreen({
    super.key,
    super.tag,
  }) : super(controller: TokenListScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 300.h,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50.h,
                horizontal: 50.w,
              ),
              child: OHOAppBar01(step: 0),
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
            child: RefreshIndicator(
              color: themeService.textColor,
              backgroundColor: themeService.textFieldBackgroundColor,
              onRefresh: () async => walletService.selectedAccount.refresh(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OHOTokenList(),
                    SizedBox(height: 1000.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
