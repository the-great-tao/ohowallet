import 'package:ohowallet/core/exports.dart';

class NetworkListItemController extends BaseController {}

class NetworkListItem extends BaseWidget<NetworkListItemController> {
  final String networkKey;
  final Network network;
  final bool useRandomIcon;
  final bool editable;

  NetworkListItem({
    super.key,
    super.tag,
    required this.networkKey,
    required this.network,
    this.useRandomIcon = false,
    this.editable = false,
  }) : super(controller: NetworkListItemController());

  Widget get randomIcon => ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: SizedBox(
          width: 150.r,
          height: 150.r,
          child: AvatarGenerator(
            seed: networkKey,
            colors: themeService.randomIconColors,
            verticalTileCount: 3,
            horizontalTileCount: 3,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: themeService.listItemInkwellHighlightColor,
        splashColor: themeService.listItemInkwellSplashColor,
        onTap: () => walletService.setSelectedNetwork(networkKey),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
            horizontal: 50.w,
          ),
          child: Row(
            children: [
              useRandomIcon
                  ? randomIcon
                  : SvgPicture.asset(
                      'assets/icons/network-$networkKey.svg',
                      width: 150.r,
                      height: 150.r,
                    ),
              SizedBox(width: 50.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OHOHeaderText(
                    network.name,
                    fontSize: 50.sp,
                  ),
                  OHOText(
                    'Symbol: ${network.currencySymbol}',
                    fontSize: 40.sp,
                  ),
                ],
              ),
              Expanded(child: Container()),
              Obx(
                () => Icon(
                  Icons.check,
                  size: 100.sp,
                  color: networkKey != walletService.selectedNetwork.value
                      ? Colors.transparent
                      : OHOColors.green3,
                ),
              ),
              !editable ? Container() : SizedBox(width: 10.w),
              !editable
                  ? Container()
                  : GestureDetector(
                      onTap: () => Get.to(
                        () => AddNetworkScreen(
                          isEditing: true,
                          networkKey: networkKey,
                          network: network,
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 60.sp,
                        color: themeService.textColor,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class NetworkListScreenController extends BaseController {
  var editable = false.obs;
}

class NetworkListScreen extends BaseWidget<NetworkListScreenController> {
  NetworkListScreen({
    super.key,
    super.tag,
  }) : super(controller: NetworkListScreenController());

  Widget get defaultNetworks => Column(
        children: [
          for (var networkKey
              in walletService.defaultNetworks.value.networks.keys)
            NetworkListItem(
              networkKey: networkKey,
              network:
                  walletService.defaultNetworks.value.networks[networkKey]!,
            ),
        ],
      );

  Widget get customNetworks => Column(
        children: [
          for (var networkKey
              in walletService.customNetworks.value.networks.keys)
            NetworkListItem(
              networkKey: networkKey,
              network: walletService.customNetworks.value.networks[networkKey]!,
              useRandomIcon: true,
              editable: controller.editable.value,
            ),
        ],
      );

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OHOHeaderText('Networks'),
                  SizedBox(height: 50.h),
                  const Divider(color: OHOColors.grey5),
                  SizedBox(height: 50.h),
                  OHOText(
                    'Default Networks',
                    fontSize: 60.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  defaultNetworks,
                  SizedBox(height: 50.h),
                  const Divider(color: OHOColors.grey5),
                  SizedBox(height: 50.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OHOText(
                          'Custom Networks',
                          fontSize: 60.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Positioned(
                        right: 50.w,
                        child: GestureDetector(
                          onTap: () => controller.editable.value =
                              !controller.editable.value,
                          child: Icon(
                            Icons.edit,
                            size: 60.sp,
                            color: themeService.textColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  customNetworks,
                  SizedBox(height: 50.h),
                  OHOSolidButton(
                    title: 'Add Custom Network',
                    onTap: () => Get.to(() => AddNetworkScreen()),
                  ),
                  SizedBox(height: 500.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
