import 'package:ohowallet/core/exports.dart';

class OHOAppBar01Controller extends BaseController {}

class OHOAppBar01 extends BaseWidget<OHOAppBar01Controller> {
  final int step;

  OHOAppBar01({
    super.key,
    super.tag,
    required this.step,
  }) : super(controller: OHOAppBar01Controller());

  Widget stepCircle(int stepNumber) {
    final color = stepNumber <= step ? themeService.textColor : OHOColors.grey5;
    return Container(
      width: 100.r,
      height: 100.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: themeService.textFieldBackgroundColor,
        border: Border.all(
          width: 5.sp,
          color: color,
        ),
      ),
      child: Center(
        child: Text(
          stepNumber.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontFamily: 'Outfit',
            fontSize: 60.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.sp,
          ),
        ),
      ),
    );
  }

  Widget stepDivider(int stepNumber) {
    final color = stepNumber < step ? themeService.textColor : OHOColors.grey5;
    return SizedBox(
      width: 200.r,
      height: 100.r,
      child: Divider(
        color: color,
        thickness: 5.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 50.r,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back,
                size: 100.sp,
                color: themeService.textColor,
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/oho_logo_square_256.png',
                width: 200.r,
              ),
              SizedBox(height: 50.r),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  stepCircle(1),
                  stepDivider(1),
                  stepCircle(2),
                  stepDivider(2),
                  stepCircle(3),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
