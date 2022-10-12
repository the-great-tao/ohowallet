import 'package:ohowallet/core/exports.dart';

class NetworkListItemController extends BaseController {}

class NetworkListItem extends BaseWidget<NetworkListItemController> {
  final String networkKey;
  final Network network;
  final bool useRandomIcon;

  NetworkListItem({
    super.key,
    super.tag,
    required this.networkKey,
    required this.network,
    this.useRandomIcon = false,
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
    return InkWell(
      highlightColor: themeService.networkListItemInkwellHighlightColor,
      splashColor: themeService.networkListItemInkwellSplashColor,
      onTap: () => walletService.setSelectedNetwork(networkKey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(50.w, 25.h, 50.w, 25.h),
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
              () => networkKey != walletService.selectedNetwork.value
                  ? Container()
                  : Icon(
                      Icons.check,
                      size: 100.sp,
                      color: OHOColors.green3,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class NetworkListScreenController extends BaseController {}

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
            bottom: false,
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
                  OHOText(
                    'Custom Networks',
                    fontSize: 60.sp,
                    fontWeight: FontWeight.normal,
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
