import 'package:ohowallet/core/exports.dart';

class OHOAppBar02Controller extends BaseController {}

class OHOAppBar02 extends BaseWidget<OHOAppBar02Controller> {
  final String? namePage;
  final bool? hasBackSign;

  OHOAppBar02({
    super.key,
    super.tag,
    this.namePage,
    this.hasBackSign,
  }) : super(controller: OHOAppBar02Controller());

  @override
  Widget build(BuildContext context) {
    final bool _hasBackSign = hasBackSign ?? true;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              if (_hasBackSign == true)
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
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/oho_logo_square_256.png',
                  width: 200.r,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25.r,),
        OHOHeaderText(namePage ?? ''),
        SizedBox(height: 30.r,),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 0,
          color: OHOColors.grey5,
        ),
      ],
    );
  }
}
