import 'package:ohowallet/core/exports.dart';

class TokenListItemController extends BaseController {}

class TokenListItem extends BaseWidget<TokenListItemController> {
  final String tokenKey;
  final Token token;
  final bool editable;
  final bool getBackOnSelected;

  TokenListItem({
    super.key,
    super.tag,
    required this.tokenKey,
    required this.token,
    this.editable = false,
    this.getBackOnSelected = true,
  }) : super(controller: TokenListItemController());

  Widget get randomIcon => ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: SizedBox(
          width: 150.r,
          height: 150.r,
          child: AvatarGenerator(
            seed: tokenKey,
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
        onTap: () async {
          await walletService.setSelectedToken(tokenKey);
          if (getBackOnSelected) Get.back();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
            horizontal: 50.w,
          ),
          child: Row(
            children: [
              token.iconUrl == null || token.iconUrl!.isEmpty
                  ? randomIcon
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(9999),
                      child: CachedNetworkImage(
                        width: 150.r,
                        height: 150.r,
                        imageUrl: token.iconUrl!,
                        placeholder: (context, url) => randomIcon,
                        errorWidget: (context, url, error) => randomIcon,
                      ),
                    ),
              SizedBox(width: 50.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OHOHeaderText(
                    token.name,
                    fontSize: 50.sp,
                  ),
                  OHOText(
                    WalletService.getShortHex(
                      token.address.hexEip55,
                      partLength: 8,
                    ),
                    fontSize: 40.sp,
                  ),
                ],
              ),
              Expanded(child: Container()),
              Obx(
                () => Icon(
                  Icons.check,
                  size: 100.sp,
                  color: tokenKey != walletService.selectedToken.value
                      ? Colors.transparent
                      : OHOColors.green3,
                ),
              ),
              !editable ? Container() : SizedBox(width: 10.w),
              !editable
                  ? Container()
                  : GestureDetector(
                      onTap: () => Get.to(
                        () => AddTokenScreen(
                          isEditing: true,
                          tokenKey: tokenKey,
                          token: token,
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

class TokenListScreenController extends BaseController {
  var editable = false.obs;
}

class TokenListScreen extends BaseWidget<TokenListScreenController> {
  final bool getBackOnSelected;

  TokenListScreen({
    super.key,
    super.tag,
    this.getBackOnSelected = true,
  }) : super(controller: TokenListScreenController());

  Widget getTokens() {
    final tokens = walletService.tokens.value.tokens;
    final networkTokens = tokens[walletService.selectedNetwork.value];
    if (networkTokens == null) return Container();
    return Column(
      children: [
        for (var tokenKey in networkTokens.keys)
          TokenListItem(
            tokenKey: tokenKey,
            token: walletService.getTokenByAddress(tokenKey)!,
            editable: controller.editable.value,
            getBackOnSelected: getBackOnSelected,
          ),
      ],
    );
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
              child: OHOAppBar02(),
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OHOHeaderText('Tokens'),
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
                  getTokens(),
                  SizedBox(height: 50.h),
                  OHOSolidButton(
                    title: 'Import Token',
                    onTap: () => Get.to(() => AddTokenScreen()),
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
