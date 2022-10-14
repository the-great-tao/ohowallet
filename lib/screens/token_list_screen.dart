import 'package:ohowallet/core/exports.dart';

class TokenListItemController extends BaseController {
  final String tokenKey;
  final Token token;
  final bool getBackOnSelected;
  var editable = false.obs;
  var loading = false.obs;
  var decimals = BigInt.zero.obs;
  var balance = BigInt.zero.obs;
  var balanceString = '...'.obs;

  TokenListItemController({
    required this.tokenKey,
    required this.token,
    this.getBackOnSelected = true,
    bool editable = false,
  }) : super() {
    this.editable.value = editable;
  }

  Future<void> toggleEditable() async {
    editable.value = !editable.value;
  }

  Future<void> refreshToken() async {
    final selectedNetwork = walletService.selectedNetworkInstance;
    final selectedAccount = walletService.selectedAccountInstance;
    if (selectedNetwork == null || selectedAccount == null) {
      balanceString.value = '...';
      return;
    }

    final token_ = WalletService.getERC20Token(
      contractAddress: token.address,
      rpcUrl: selectedNetwork.rpcUrl,
      chainId: selectedNetwork.chainId.toInt(),
    );

    loading.value = true;
    decimals.value = await token_.decimals();
    balance.value = await token_.balanceOf(selectedAccount.address);
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

  Future<void> onTap() async {
    refreshToken();
    await walletService.setSelectedToken(tokenKey);
    if (getBackOnSelected) Get.back();
  }
}

class TokenListItem extends BaseWidget<TokenListItemController> {
  final String tokenKey;
  final Token token;

  TokenListItem({
    super.key,
    super.tag,
    required this.tokenKey,
    required this.token,
    bool editable = false,
    bool getBackOnSelected = true,
  }) : super(
          controller: TokenListItemController(
            tokenKey: tokenKey,
            token: token,
            getBackOnSelected: getBackOnSelected,
            editable: editable,
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
    return Obx(
      () => Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: themeService.listItemInkwellHighlightColor,
          splashColor: themeService.listItemInkwellSplashColor,
          onTap: () => controller.onTap(),
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
                              ? '${token.symbol} ...'
                              : '${token.symbol} - ${controller.balanceString.value}',
                          softWrap: false,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                !controller.editable.value
                    ? Container()
                    : SizedBox(width: 10.w),
                !controller.editable.value
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
      ),
    );
  }
}

class TokenListScreenController extends BaseController {
  Future<void> toggleEditable() async {
    final tokens = walletService.tokens.value.tokens;
    final selectedNetwork = walletService.selectedNetwork.value;
    final networkTokens = tokens[selectedNetwork];
    if (networkTokens == null) return;
    for (var tokenKey in networkTokens.keys) {
      var tokenListItemController = Get.find<TokenListItemController>(
        tag: 'token-$selectedNetwork-$tokenKey',
      );
      tokenListItemController.toggleEditable();
    }
  }
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
    final selectedNetwork = walletService.selectedNetwork.value;
    final networkTokens = tokens[selectedNetwork];
    if (networkTokens == null) return Container();
    return Column(
      children: [
        for (var tokenKey in networkTokens.keys)
          TokenListItem(
            tag: 'token-$selectedNetwork-$tokenKey',
            tokenKey: tokenKey,
            token: walletService.getTokenByAddress(tokenKey)!,
            getBackOnSelected: getBackOnSelected,
          )..controller.refreshToken(),
      ],
    );
  }

  Widget get accountBalance => walletService.selectedAccount.value.isEmpty
      ? Container()
      : (OHOAccountBalance()..controller.refreshBalance());

  Widget get accountAddress => walletService.selectedAccount.value.isEmpty
      ? Container()
      : (OHOAccountAddress()..controller.refreshAddress());

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
            child: RefreshIndicator(
              color: themeService.textColor,
              backgroundColor: themeService.textFieldBackgroundColor,
              onRefresh: () async => walletService.selectedAccount.refresh(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    accountBalance,
                    SizedBox(height: 50.h),
                    accountAddress,
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OHOSolidButton(
                          width: 350.w,
                          height: 120.h,
                          title: 'Send',
                          fontSize: 50.sp,
                          icon: Icon(
                            FontAwesomeIcons.solidPaperPlane,
                            color: themeService.solidButtonTextColor,
                            size: 50.sp,
                          ),
                        ),
                        OHOSolidButton(
                          width: 350.w,
                          height: 120.h,
                          title: 'Receive',
                          fontSize: 50.sp,
                          icon: Icon(
                            FontAwesomeIcons.circleDollarToSlot,
                            color: themeService.solidButtonTextColor,
                            size: 50.sp,
                          ),
                          onTap: () => Get.to(
                            () => AccountReceiveScreen(
                              account: walletService.selectedAccountInstance!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    const Divider(color: OHOColors.grey5),
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
                            onTap: () => controller.toggleEditable(),
                            child: Icon(
                              Icons.edit,
                              size: 60.sp,
                              color: themeService.textColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 50.h),
                    getTokens(),
                    SizedBox(height: 50.h),
                    OHOSolidButton(
                      title: 'Import Token',
                      onTap: () => Get.to(() => AddTokenScreen()),
                    ),
                    SizedBox(height: 1000.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
