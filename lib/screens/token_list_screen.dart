import 'package:ohowallet/core/exports.dart';

class TokenListItemController extends BaseController {
  final String tokenKey;
  final Token token;
  late ERC20 _token;
  var decimals = BigInt.zero.obs;
  var balance = BigInt.zero.obs;
  var balanceString = '0'.obs;
  var loading = false.obs;

  TokenListItemController({
    required this.tokenKey,
    required this.token,
  }) : super();

  @override
  void onInit() {
    super.onInit();
    _token = WalletService.getERC20Token(
      contractAddress: token.address,
      rpcUrl: walletService.selectedNetworkInstance!.rpcUrl,
      chainId: walletService.selectedNetworkInstance!.chainId.toInt(),
    );
  }

  @override
  void onReady() {
    super.onReady();
    getTokenInfo();
  }

  Future<void> getTokenInfo() async {
    loading.value = true;
    decimals.value = await _token.decimals();
    balance.value =
        await _token.balanceOf(walletService.selectedAccountInstance!.address);
    loading.value = false;

    var decimals_ = decimals.value.toInt();
    var balance_ = balance.value;

    if (decimals_ > 12) {
      balance_ = balance_ ~/ BigInt.from(10).pow(decimals_ - 12);
      decimals_ = 12;
    }

    balanceString.value =
        (balance_ / BigInt.from(10).pow(decimals_)).toStringAsFixed(decimals_);
  }
}

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
  }) : super(
          controller: TokenListItemController(
            tokenKey: tokenKey,
            token: token,
          ),
        );

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
              SizedBox(
                height: 150.r,
                width: 650.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OHOHeaderText(
                      token.name,
                      softWrap: false,
                      fontSize: 50.sp,
                      overflow: TextOverflow.fade,
                    ),
                    Obx(
                      () => OHOText(
                        controller.loading.value
                            ? '${token.symbol} - Loading Balance...'
                            : '${token.symbol} - ${controller.balanceString}',
                        softWrap: false,
                        fontSize: 40.sp,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
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
            tag: 'token-list-item-$tokenKey',
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
