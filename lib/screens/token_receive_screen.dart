import 'package:ohowallet/core/exports.dart';

class TokenReceiveScreenController extends BaseController {}

class TokenReceiveScreen extends BaseWidget<TokenReceiveScreenController> {
  final Account account;

  TokenReceiveScreen({
    super.key,
    super.tag,
    required this.account,
  }) : super(controller: TokenReceiveScreenController());

  Widget getAccountAddress() {
    if (walletService.selectedAccount.value.isEmpty) return Container();
    return OHOAccountAddress()..controller.refreshAddress();
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
              child: OHOAppBar02(hasBackButton: true),
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
                  SizedBox(height: 50.h),
                  OHOHeaderText('Token Receive'),
                  SizedBox(height: 50.h),
                  OHOText(
                    'Scan or copy account address\nto receive coin or token.',
                  ),
                  SizedBox(height: 50.h),
                  QrImage(
                    size: 700.w,
                    foregroundColor: themeService.textColor,
                    version: QrVersions.auto,
                    errorCorrectionLevel: QrErrorCorrectLevel.Q,
                    data: account.address.hexEip55,
                  ),
                  SizedBox(height: 50.h),
                  getAccountAddress(),
                  SizedBox(height: 100.h),
                  OHOSolidButton(
                    title: 'OK',
                    onTap: () => Get.back(),
                  ),
                  SizedBox(height: 1000.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
