import 'package:ohowallet/core/exports.dart';

class AccountReceiveScreenController extends BaseController {}

class AccountReceiveScreen extends BaseWidget<AccountReceiveScreenController> {
  final Account account;

  AccountReceiveScreen({
    super.key,
    super.tag,
    required this.account,
  }) : super(controller: AccountReceiveScreenController());

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
            child: Column(
              children: [
                OHOHeaderText('Receive'),
                SizedBox(height: 200.h),
                OHOText(
                  'Scan or copy account address\nto receive coin or token.',
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QrImage(
                        size: 600.r,
                        padding: EdgeInsets.all(4.r),
                        foregroundColor: themeService.textColor,
                        version: QrVersions.auto,
                        errorCorrectionLevel: QrErrorCorrectLevel.Q,
                        data: account.address.hexEip55,
                      ),
                      SizedBox(height: 100.h),
                      OHOAccountAddress(),
                    ],
                  ),
                ),
                SizedBox(height: 200.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
