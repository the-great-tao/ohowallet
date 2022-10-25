import 'package:ohowallet/core/exports.dart';

class CollectibleMainScreenController extends BaseController {
  static const pageSize = 10;
  final PagingController<String?, MoralisGetNFTsByWalletResultItem>
      pagingController = PagingController(firstPageKey: null);

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
      final response = await walletService.moralisGetNFTsByWallet();
      final collectibles = MoralisGetNFTsByWalletResponse.fromJson(response!);

      final newItems = collectibles.result;
      if (newItems == null) return;

      for (var newItem in newItems) {
        if (newItem.metadata == null) continue;
        newItem.metadata_ = NFTMetadata.fromJson(jsonDecode(newItem.metadata!));
      }

      final nextPageKey = collectibles.cursor;
      final isLastPage = nextPageKey == null ||
          nextPageKey.isEmpty ||
          newItems.length < pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}

class CollectibleMainScreen
    extends BaseWidget<CollectibleMainScreenController> {
  String? networkKey;
  String? accountKey;

  CollectibleMainScreen({
    super.key,
    super.tag,
  }) : super(controller: CollectibleMainScreenController());

  Widget get pageHeader => Column(
        children: [
          SizedBox(height: 50.h),
          OHOHeaderText('Collectibles'),
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
      return Container(
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
                    OHOText(
                      'Pull to refresh Collectibles page or tap on a Collectible to view it for more details.',
                    ),
                    SizedBox(height: 100.h),
                  ]),
                ),
                PagedSliverGrid<String?, MoralisGetNFTsByWalletResultItem>(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<
                      MoralisGetNFTsByWalletResultItem>(
                    firstPageProgressIndicatorBuilder: (context) =>
                        SpinKitFadingCircle(color: themeService.textColor),
                    newPageProgressIndicatorBuilder: (context) =>
                        SpinKitFadingCircle(color: themeService.textColor),
                    firstPageErrorIndicatorBuilder: (context) => Column(
                      children: [
                        OHOText(
                          'There is problem loading Collectibles or the current selected network is unsupported.',
                        ),
                      ],
                    ),
                    itemBuilder: (context, item, index) => GestureDetector(
                      onTap: () {},
                      //   Get.dialog(
                      //     Dialog(
                      //       backgroundColor: Colors.transparent,
                      //       child: NFTDetailsScreen(
                      //         tag: 'nft-details-screen',
                      //         owner: controller.walletService.accountAddress!,
                      //         contract:
                      //             EthereumAddress.fromHex(item.contract!.address!),
                      //         id: BigInt.parse(item.id!.tokenId!),
                      //         name: item.title,
                      //         description: item.metadata!.description,
                      //         imageUrl: item.metadata!.image,
                      //         animationUrl: item.metadata!.animationUrl,
                      //         reward: item.reward,
                      //       ),
                      //       insetPadding: EdgeInsets.symmetric(
                      //         horizontal: 40.w,
                      //         vertical: 60.h,
                      //       ),
                      //     ),
                      //   );
                      // },
                      child: Card(
                        elevation: 0.0,
                        color: themeService.textFieldBackgroundColor
                            .withOpacity(0.5),
                        margin: EdgeInsets.fromLTRB(
                          index % 2 == 0 ? 0.w : 20.w,
                          20.h,
                          index % 2 == 0 ? 20.w : 0.w,
                          20.h,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: themeService.textFieldBorderColor,
                            width: 5.r,
                          ),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(50.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: item.metadata_ == null ||
                                        item.metadata_!.image == null
                                    ? Container()
                                    : CachedNetworkImage(
                                        imageUrl: item.metadata_!.image!,
                                      ),
                              ),
                              SizedBox(height: 20.h),
                              OHOHeaderText(
                                item.metadata_!.name!,
                                softWrap: false,
                                fontSize: 35.sp,
                                overflow: TextOverflow.fade,
                              ),
                              SizedBox(height: 10.h),
                              OHOText(
                                'ID: #${NumberFormat('000000000').format(item.tokenId!.toInt())}',
                                softWrap: false,
                                fontSize: 35.sp,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (context) => Column(
                      children: [
                        OHOText('There is no Collectible.'),
                      ],
                    ),
                    noMoreItemsIndicatorBuilder: (context) =>
                        SizedBox(height: 1000.h),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
