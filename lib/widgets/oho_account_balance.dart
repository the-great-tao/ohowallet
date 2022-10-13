import 'package:ohowallet/core/exports.dart';

class OHOAccountBalanceController extends BaseController {
  var loading = false.obs;
  var symbol = ''.obs;
  var balance = EtherAmount.zero();
  var balanceString = '0'.obs;

  Future<void> getAccountInfo() async {
    final web3client = Web3Client(
      walletService.selectedNetworkInstance!.rpcUrl,
      Client(),
    );

    loading.value = true;
    balance = await web3client.getBalance(
      walletService.selectedAccountInstance!.address,
    );
    print(balance);
    symbol.value = walletService.selectedNetworkInstance!.currencySymbol;
    loading.value = false;

    var decimals_ = 18;
    var balance_ = balance.getInWei;

    if (decimals_ > 6) {
      balance_ = balance_ ~/ BigInt.from(10).pow(decimals_ - 6);
      decimals_ = 6;
    }

    balanceString.value =
        (balance_ / BigInt.from(10).pow(decimals_)).toStringAsFixed(decimals_);
  }
}

class OHOAccountBalance extends BaseWidget<OHOAccountBalanceController> {
  OHOAccountBalance({
    super.key,
    super.tag,
  }) : super(controller: OHOAccountBalanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => OHOText(
        controller.loading.value
            ? '...'
            : '${controller.balanceString.value} ${controller.symbol.value}',
        softWrap: false,
        fontSize: 70.sp,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
