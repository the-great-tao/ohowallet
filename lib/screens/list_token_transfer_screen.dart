import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/models/MoralisGetWalletTransactionsResponse.dart';

class ListTokenTransferScreenController extends BaseController {
  static const limit = 10;
  final PagingController<String?, MoralisGetWalletTransactionsItem>
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

  SentReceived sendOrReceived(String fromAddress, String toAddress) {
    SentReceived temp = OHOWalletService.sendOrReceived(fromAddress, toAddress);
    print('sendOrReceived');
    print(temp);
    return OHOWalletService.sendOrReceived(fromAddress, toAddress);
  }

  double amountSentReceived(BigInt value, String decimals) {
    try {
      double temp = value / BigInt.from(10).pow(int.parse(decimals));
      return temp;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<MoralisGetWalletTransactionsItemMetadata> addMetadata(
      String? addresses) async {
    final response =
        await ohoWalletService.moralisGetTokenMetadata(addresses: addresses);

    final moralisGetWalletTransactionsItemMetadata =
        MoralisGetWalletTransactionsItemMetadata.fromJson(response!);

    return moralisGetWalletTransactionsItemMetadata;
  }

  Future<void> _fetchPage(String? pageKey) async {
    try {
      final response = await ohoWalletService.moralisGetWalletTokenTransfer(
        cursor: pageKey,
        limit: 10,
      );
      final moralisGetWalletTransactionsResponse =
          MoralisGetWalletTransactionsResponse.fromJson(response!);

      final transfers = moralisGetWalletTransactionsResponse.result;
      if (transfers == null) return;

      final nextPageKey = moralisGetWalletTransactionsResponse.cursor;
      final isLastPage = nextPageKey == null;

      for (var index = 0; index < transfers.length; index++) {
        final transfer = transfers[index];

        transfer.formatedTime =
            ohoWalletService.handleDateString(transfer.blockTimestamp!);
        transfer.metadata = await addMetadata(transfer.address);
        transfer.amountSentReceived = amountSentReceived(
            transfer.value!, transfer.metadata?.decimals ?? '');
      }

      if (isLastPage) {
        pagingController.appendLastPage(transfers);
      } else {
        pagingController.appendPage(transfers, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}

class ListTokenTransferScreen
    extends BaseWidget<ListTokenTransferScreenController> {
  ListTokenTransferScreen({
    super.key,
    String? tag,
  }) : super(controller: ListTokenTransferScreenController(), tag: tag);

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
              child: PagedListView<String?, MoralisGetWalletTransactionsItem>(
                pagingController: controller.pagingController,
                builderDelegate:
                    PagedChildBuilderDelegate<MoralisGetWalletTransactionsItem>(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 55.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item.formatedTime ?? '',
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
                          SizedBox(height: 20.h),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 70.sp,
                                          backgroundImage:
                                              AssetImage("assets/images/oho_logo_square_512.png")),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.metadata?.name ?? '',
                                            style: TextStyle(
                                              color: OHOColors.blue5,
                                              fontSize: 50.sp,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.sp,
                                            ),
                                          ),
                                          Text(
                                            item.metadata?.validated == 1
                                                ? 'Confirmed'
                                                : 'Failed',
                                            style: TextStyle(
                                              color: OHOColors.blue3,
                                              fontSize: 45.sp,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.sp,
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(children: [
                                    SizedBox(
                                      width: 320.w,
                                      child: Text(
                                        '${item.amountSentReceived} ${item.metadata?.symbol}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: OHOColors.blue5,
                                          fontSize: 45.sp,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.sp,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
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
