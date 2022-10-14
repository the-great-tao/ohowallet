import 'package:ohowallet/core/exports.dart';

class OHOAccountBalanceController extends BaseController {
  var loading = false.obs;
  var symbol = '...'.obs;
  var balance = EtherAmount.zero();
  var balanceString = '...'.obs;

  Future<void> refreshBalance() async {
    final selectedNetwork = walletService.selectedNetworkInstance;
    final selectedAccount = walletService.selectedAccountInstance;
    if (selectedNetwork == null || selectedAccount == null) {
      symbol.value = '...';
      balanceString.value = '...';
      return;
    }

    final web3client = Web3Client(selectedNetwork.rpcUrl, Client());

    symbol.value = selectedNetwork.currencySymbol;

    loading.value = true;
    balance = await web3client.getBalance(selectedAccount.address);
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
      () => Column(
        children: [
          OHOHeaderText(
            controller.symbol.value,
            softWrap: false,
            fontSize: 80.sp,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.fade,
          ),
          OHOText(
            controller.loading.value ? '...' : controller.balanceString.value,
            softWrap: false,
            fontSize: 80.sp,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
