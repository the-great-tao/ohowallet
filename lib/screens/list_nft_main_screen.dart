import 'package:ohowallet/core/exports.dart';
import 'package:intl/intl.dart';
import 'package:ohowallet/models/MoralisGetWalletNFTsResponse.dart';

class ListNFTMainScreenController extends BaseController {
  static const limit = 10;
  final PagingController<String?, MoralisGetWalletNFTsResponseItem>
      pagingController = PagingController(firstPageKey: null);

  @override
  void onInit() {
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
      final response = await ohoWalletService.moralisGetWalletNFTs(
        cursor: pageKey,
      );

      final moralisGetWalletNFTsResponse =
          MoralisGetWalletNFTsResponse.fromJson(response!);
      final newItems = moralisGetWalletNFTsResponse.result;
      if (newItems == null) return;

      final nextPageKey = moralisGetWalletNFTsResponse.cursor;
      final isLastPage = nextPageKey == null;

      for (var index = 0; index < newItems.length; index++) {
        final newItem = newItems[index];
        newItem.nftItemMetadata = MoralisGetWalletNFTsResponseItemMetadata.fromJson(jsonDecode(newItem.metadata ?? '{}'));
      }

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

class ListNFTMainScreen
    extends BaseWidget<ListNFTMainScreenController> {
  ListNFTMainScreen({
    super.key,
    String? tag,
  }) : super(controller: ListNFTMainScreenController(), tag: tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: themeService.screenBackgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(50.r),
            child: RefreshIndicator(
              color: OHOColors.grey5,
              onRefresh: () async => controller.pagingController.refresh(),
              child: PagedGridView<String?, MoralisGetWalletNFTsResponseItem>(
                pagingController: controller.pagingController,
                builderDelegate:
                    PagedChildBuilderDelegate<MoralisGetWalletNFTsResponseItem>(
                  firstPageProgressIndicatorBuilder: (context) =>
                      const SpinKitFadingCircle(
                    color: OHOColors.grey5,
                  ),
                  newPageProgressIndicatorBuilder: (context) =>
                      const SpinKitFadingCircle(
                    color: OHOColors.grey5,
                  ),
                  itemBuilder: (context, item, index) => GestureDetector(
                    child: Container(
                      width: double.infinity,
                      child:
                      Card(
                        elevation: 4.sp,
                        margin: EdgeInsets.fromLTRB(
                          index % 2 == 0 ? 6.w : 12.w,
                          12.h,
                          index % 2 == 0 ? 12.w : 6.w,
                          12.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10.sp),
                          child: Column(
                            children: [
                              Expanded(
                                child: item.nftItemMetadata == null
                                    ||
                                    item.nftItemMetadata!.image == null
                                    ? Container()
                                    : CachedNetworkImage(
                                  imageUrl: item.nftItemMetadata?.image! ?? '',
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                item.nftItemMetadata?.name ?? '',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  color: OHOColors.blue5,
                                  fontSize: 45.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.sp,
                                ),
                              ),
                              Text(
                                'ID: #' +
                                    NumberFormat('000000000').format(
                                      BigInt.parse(item.tokenId!).toInt(),
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  color: OHOColors.blue5,
                                  fontSize: 45.sp,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OHOListViewBasicController extends BaseController {}

class OHOListViewBasic extends BaseWidget<OHOListViewBasicController> {
  final List list;
  final Widget? buttonWidget;

  OHOListViewBasic({
    super.key,
    String? tag,
    required this.list,
    this.buttonWidget,
  }) : super(controller: OHOListViewBasicController(), tag: tag);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        for (int index = 0; index < list.length; index++) ...[
          OHOListRowWithStick(
            image: list[index].image,
            name: list[index].name,
            selected: list[index].selected,
          ),
        ],
        SizedBox(
          height: 30.h,
        ),
        buttonWidget ?? Container(),
      ],
    );
  }
}

class OHOListRowWithStickController extends BaseController {}

class OHOListRowWithStick extends BaseWidget<OHOListRowWithStickController> {
  final String? image;
  final String? name;
  final bool? selected;

  OHOListRowWithStick({
    super.key,
    String? tag,
    this.image,
    this.name,
    this.selected,
  }) : super(controller: OHOListRowWithStickController(), tag: tag);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(image!)),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: TextStyle(
                        color: OHOColors.blue3,
                        fontSize: 18.sp,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                selected == true
                    ? Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: OHOColors.gold2,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: OHOColors.white,
                          size: 10.0,
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
