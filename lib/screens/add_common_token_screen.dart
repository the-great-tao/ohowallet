import 'package:ohowallet/core/exports.dart';

class CommonTokenItemController extends BaseController {
  Future<void> onTap({
    required String tokenKey,
    required TokenDto tokenDto,
  }) async {
    final networkKey = walletService.selectedNetwork.value;
    final tokenAddress = EthereumAddress.fromHex(tokenDto.address);
    final tokenKey = '$networkKey-${tokenAddress.hexEip55}';
    final token = Token(
      networkKey: networkKey,
      address: tokenAddress,
      name: tokenDto.name,
      symbol: tokenDto.symbol,
      decimals: tokenDto.decimals.toInt(),
      iconUrl: tokenDto.logoURI,
    );

    final tokens = walletService.tokens.value.tokens;
    if (tokens[networkKey] == null) tokens[networkKey] = {};
    final networkTokens = tokens[networkKey];
    networkTokens![tokenKey] = token;

    walletService.tokens.refresh();
    walletService.storeTokens();

    Get.back();
  }
}

class CommonTokenItem extends BaseWidget<CommonTokenItemController> {
  final String tokenKey;
  final TokenDto tokenDto;

  CommonTokenItem({
    super.key,
    super.tag,
    required this.tokenKey,
    required this.tokenDto,
  }) : super(controller: CommonTokenItemController());

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

  Widget get tokenIcon => ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: CachedNetworkImage(
          width: 150.r,
          height: 150.r,
          imageUrl: tokenDto.logoURI,
          placeholder: (context, url) => randomIcon,
          errorWidget: (context, url, error) => randomIcon,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: themeService.listItemInkwellHighlightColor,
        splashColor: themeService.listItemInkwellSplashColor,
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
            horizontal: 50.w,
          ),
          child: Row(
            children: [
              tokenDto.logoURI.isEmpty ? randomIcon : tokenIcon,
              SizedBox(width: 50.w),
              SizedBox(
                height: 150.r,
                width: 550.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OHOHeaderText(
                      tokenDto.name,
                      softWrap: false,
                      fontSize: 50.sp,
                      overflow: TextOverflow.fade,
                    ),
                    OHOText(
                      tokenDto.symbol,
                      softWrap: false,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => controller.onTap(
                  tokenKey: tokenKey,
                  tokenDto: tokenDto,
                ),
                child: OHOText(
                  'Import',
                  softWrap: false,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddCommonTokenScreenController extends BaseController {
  final PagingController<String?, TokenDto> pagingController =
      PagingController(firstPageKey: null);

  @override
  void onInit() async {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  Future<void> _fetchPage(String? pageKey) async {
    try {
      final chainId = walletService.selectedNetworkInstance!.chainId;
      final oneInchAggregation = OneInchAggregation.create(
        baseUrl: '${OHOSettings.oneInchBaseURL}/${chainId.toString()}',
      );
      final response =
          await oneInchAggregation.ChainTokensController_getTokens();

      final tokens = response.body!.tokens;
      final List<TokenDto> newItems = [];
      for (var token in tokens.values) {
        newItems.add(TokenDto.fromJson(token));
      }
      newItems.sort((tokenA, tokenB) => tokenA.symbol.compareTo(tokenB.symbol));

      pagingController.appendLastPage(newItems);
    } catch (error) {
      pagingController.error = error;
    }
  }
}

class AddCommonTokenScreen extends BaseWidget<AddCommonTokenScreenController> {
  String? networkKey;
  String? accountKey;

  AddCommonTokenScreen({
    super.key,
    super.tag,
  }) : super(controller: AddCommonTokenScreenController());

  Widget get pageHeader => Column(
        children: [
          SizedBox(height: 50.h),
          OHOHeaderText('Common Tokens'),
          SizedBox(height: 50.h),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkKey != walletService.selectedNetwork.value) {
        networkKey = walletService.selectedNetwork.value;
        controller.pagingController.refresh();
      }
      if (accountKey != walletService.selectedAccount.value) {
        accountKey = walletService.selectedAccount.value;
        controller.pagingController.refresh();
      }
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
            child: RefreshIndicator(
              color: themeService.textColor,
              backgroundColor: themeService.textFieldBackgroundColor,
              onRefresh: () async => controller.pagingController.refresh(),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      pageHeader,
                    ]),
                  ),
                  PagedSliverList<String?, TokenDto>.separated(
                    pagingController: controller.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<TokenDto>(
                      firstPageProgressIndicatorBuilder: (context) =>
                          SpinKitFadingCircle(color: themeService.textColor),
                      newPageProgressIndicatorBuilder: (context) =>
                          SpinKitFadingCircle(color: themeService.textColor),
                      firstPageErrorIndicatorBuilder: (context) => Column(
                        children: [
                          OHOText(
                            'There is problem loading Common Tokens or the current selected network is unsupported.',
                          ),
                        ],
                      ),
                      itemBuilder: (context, item, index) {
                        final networkKey = walletService.selectedNetwork.value;
                        final tokenAddress =
                            EthereumAddress.fromHex(item.address);
                        return CommonTokenItem(
                          tokenKey: '$networkKey-${tokenAddress.hexEip55}',
                          tokenDto: item,
                        );
                      },
                      noItemsFoundIndicatorBuilder: (context) => Column(
                        children: [
                          OHOText('There is no Common Token.'),
                        ],
                      ),
                      noMoreItemsIndicatorBuilder: (context) =>
                          SizedBox(height: 1000.h),
                    ),
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 50.h);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
