import 'package:ohowallet/core/exports.dart';

class OHOAppBar02Controller extends BaseController {}

class OHOAppBar02 extends BaseWidget<OHOAppBar02Controller> {
  OHOAppBar02({
    super.key,
    super.tag,
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
                Image.asset(
                  'assets/images/oho_logo_square_512.png',
                  width: 250.r,
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
