import 'package:ohowallet/core/exports.dart';

class AccountListItemController extends BaseController {}

class AccountListItem extends BaseWidget<AccountListItemController> {
  final String accountKey;
  final Account account;
  final bool editable;
  final bool getBackOnSelected;

  AccountListItem({
    super.key,
    super.tag,
    required this.accountKey,
    required this.account,
    this.editable = false,
    this.getBackOnSelected = true,
  }) : super(controller: AccountListItemController());

  Widget get randomIcon => ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: SizedBox(
          width: 150.r,
          height: 150.r,
          child: AvatarGenerator(
            seed: accountKey,
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
          await walletService.setSelectedAccount(accountKey);
          if (getBackOnSelected) Get.back();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
            horizontal: 50.w,
          ),
          child: Row(
            children: [
              randomIcon,
              SizedBox(width: 50.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OHOHeaderText(
                    account.name,
                    fontSize: 50.sp,
                  ),
                  OHOText(
                    WalletService.getShortHex(
                      account.address.hexEip55,
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
                  color: accountKey != walletService.selectedAccount.value
                      ? Colors.transparent
                      : OHOColors.green3,
                ),
              ),
              !editable ? Container() : SizedBox(width: 10.w),
              !editable
                  ? Container()
                  : GestureDetector(
                      onTap: () => Get.to(
                        () => AddAccountScreen(
                          isEditing: true,
                          accountKey: accountKey,
                          account: account,
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

class AccountListScreenController extends BaseController {
  var editable = false.obs;
}

class AccountListScreen extends BaseWidget<AccountListScreenController> {
  final bool getBackOnSelected;

  AccountListScreen({
    super.key,
    super.tag,
    this.getBackOnSelected = true,
  }) : super(controller: AccountListScreenController());

  Widget get accounts => Column(
        children: [
          for (var accountKey in walletService.accounts.value.accounts.keys)
            AccountListItem(
              accountKey: accountKey,
              account: walletService.accounts.value.accounts[accountKey]!,
              editable: controller.editable.value,
              getBackOnSelected: getBackOnSelected,
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OHOHeaderText('Accounts'),
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
                  accounts,
                  SizedBox(height: 50.h),
                  OHOSolidButton(
                    title: 'Add Account',
                    onTap: () => Get.to(() => AddAccountScreen()),
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
