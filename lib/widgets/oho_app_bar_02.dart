import 'package:ohowallet/core/exports.dart';

class OHOAppBar02Controller extends BaseController {}

class OHOAppBar02 extends BaseWidget<OHOAppBar02Controller> {
  final bool hasBackButton;

  OHOAppBar02({
    super.key,
    super.tag,
    this.hasBackButton = false,
  }) : super(controller: OHOAppBar02Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 400.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                !hasBackButton
                    ? Image.asset(
                        'assets/images/oho_logo_square_512.png',
                        width: 250.w,
                      )
                    : Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.arrow_back,
                              size: 100.sp,
                              color: themeService.textColor,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Image.asset(
                            'assets/images/oho_logo_square_512.png',
                            width: 180.w,
                          ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OHONetworkChip(
                      networkKey: walletService.selectedNetwork.value,
                      network: walletService.selectedNetworkInstance!,
                    ),
                    OHOAccountChip(
                      accountKey: walletService.selectedAccount.value,
                      account: walletService.selectedAccountInstance!,
                      getBackOnSelected: (accountKey, account) =>
                          walletService.setSelectedAccount(accountKey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 20.h,
            color: OHOColors.grey5,
          ),
        ],
      ),
    );
  }
}
