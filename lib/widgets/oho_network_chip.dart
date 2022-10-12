import 'package:ohowallet/core/exports.dart';

class OHONetworkChipController extends BaseController {}

class OHONetworkChip extends BaseWidget<OHONetworkChipController> {
  final String networkKey;
  final Network network;

  OHONetworkChip({
    super.key,
    super.tag,
    required this.networkKey,
    required this.network,
  }) : super(controller: OHONetworkChipController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => Get.to(() => NetworkListScreen()),
        child: Container(
          width: 700.w,
          height: 150.h,
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
              walletService.isSelectedDefaultNetwork
                  ? SvgPicture.asset(
                      'assets/icons/network-$networkKey.svg',
                      width: 120.h,
                      height: 120.h,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(9999),
                      child: SizedBox(
                        width: 120.h,
                        height: 120.h,
                        child: AvatarGenerator(
                          seed: networkKey,
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
                      network.name,
                      softWrap: false,
                      fontSize: 40.sp,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
                    width: 400.w,
                    child: OHOText(
                      'Symbol: ${network.currencySymbol}',
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
