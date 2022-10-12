import 'package:ohowallet/core/exports.dart';

class OHOAccountChipController extends BaseController {}

class OHOAccountChip extends BaseWidget<OHOAccountChipController> {
  final String accountKey;
  final Account account;

  OHOAccountChip({
    super.key,
    super.tag,
    required this.accountKey,
    required this.account,
  }) : super(controller: OHOAccountChipController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => Get.to(() => AccountListScreen()),
        child: Container(
          width: 700.w,
          height: 160.h,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: themeService.textFieldBackgroundColor,
            border: Border.all(
              width: 5.r,
              color: themeService.textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9999),
                child: SizedBox(
                  width: 120.h,
                  height: 120.h,
                  child: AvatarGenerator(
                    seed: accountKey,
                    colors: themeService.randomIconColors,
                    verticalTileCount: 3,
                    horizontalTileCount: 3,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 400.w,
                    child: OHOHeaderText(
                      account.name,
                      softWrap: false,
                      fontSize: 40.sp,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
                    width: 400.w,
                    child: OHOText(
                      WalletService.getShortHex(
                        account.address.hexEip55,
                        partLength: 6,
                      ),
                      softWrap: false,
                      fontSize: 40.sp,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              // SizedBox(width: 20.r),
              Icon(
                Icons.arrow_drop_down,
                size: 100.sp,
                color: themeService.textFieldBorderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
