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
      () => SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OHONetworkChip(
              networkKey: walletService.selectedNetwork.value,
              network: walletService.selectedNetworkInstance!,
            ),
            OHOAccountChip(
              accountKey: walletService.selectedAccount.value,
              account: walletService.selectedAccountInstance!,
            ),
            const Divider(color: OHOColors.grey5),
          ],
        ),
      ),
    );
  }
}
