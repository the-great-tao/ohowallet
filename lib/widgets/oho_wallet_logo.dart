import 'package:ohowallet/core/exports.dart';

class OHOWalletLogoController extends BaseController {}

class OHOWalletLogo extends BaseWidget<OHOWalletLogoController> {
  OHOWalletLogo({
    super.key,
    super.tag,
  }) : super(controller: OHOWalletLogoController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/oho_logo_square_512.png',
          width: 400.r,
        ),
        SizedBox(height: 10.h),
        Text(
          'OHO',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: themeService.headerTextColor,
            fontFamily: 'Outfit',
            fontSize: 100.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 4.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Universal EVM Wallet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: themeService.textColor,
            fontFamily: 'Outfit',
            fontSize: 60.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.sp,
          ),
        ),
      ],
    );
  }
}
