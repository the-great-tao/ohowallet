import 'package:ohowallet/core/exports.dart';

class TransactionHistoryScreenController extends BaseController {
  // static const pageSize = 20;
  // final PagingController<String?, AlchemyGetNftsForOwnerItem> pagingController =
  // PagingController(firstPageKey: null);
}

class TransactionHistoryScreen
    extends BaseWidget<TransactionHistoryScreenController> {
  final Account account;

  TransactionHistoryScreen({
    super.key,
    super.tag,
    required this.account,
  }) : super(controller: TransactionHistoryScreenController());

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
              child: OHOAppBar02(hasBackButton: true),
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
                  OHOHeaderText('Transaction History'),
                  SizedBox(height: 1000.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
