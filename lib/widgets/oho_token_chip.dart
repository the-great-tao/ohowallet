import 'package:ohowallet/core/exports.dart';

class OHOTokenChipController extends BaseController {
  Token? token;
  var loading = false.obs;
  var decimals = BigInt.zero.obs;
  var balance = BigInt.zero.obs;
  var balanceString = '...'.obs;

  OHOTokenChipController({
    this.token,
  }) : super();

  Future<void> refreshToken(bool tokenRefreshing) async {
    if (!tokenRefreshing) return;

    balanceString.value = '...';

    if (token == null) return;
    final network = walletService.getNetworkByKey(token!.networkKey);
    final selectedAccount = walletService.selectedAccountInstance;
    if (network == null || selectedAccount == null) return;

    loading.value = true;
    if (token!.address.hexEip55 == OHOSettings.nativeTokenAddress) {
      final web3Client = Web3Client(network.rpcUrl, Client());
      decimals.value = BigInt.from(OHOSettings.nativeTokenDecimals);
      balance.value =
          (await web3Client.getBalance(selectedAccount.address)).getInWei;
    } else {
      final token_ = WalletService.getERC20Token(
        contractAddress: token!.address,
        rpcUrl: network.rpcUrl,
        chainId: network.chainId.toInt(),
      );
      decimals.value = await token_.decimals();
      balance.value = await token_.balanceOf(selectedAccount.address);
    }
    loading.value = false;

    var decimals_ = decimals.value.toInt();
    var balance_ = balance.value;

    if (decimals_ > 12) {
      balance_ = balance_ ~/ BigInt.from(10).pow(decimals_ - 12);
      decimals_ = 12;
    }

    balanceString.value =
        (balance_ / BigInt.from(10).pow(decimals_)).toStringAsFixed(decimals_);
  }
}

class OHOTokenChip extends BaseWidget<OHOTokenChipController> {
  final String tokenKey;
  final Token? token;
  final Function getBackOnSelected;

  OHOTokenChip({
    super.key,
    super.tag,
    required this.tokenKey,
    this.token,
    required this.getBackOnSelected,
  }) : super(controller: OHOTokenChipController(token: token));

  Widget get randomIcon => ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: SizedBox(
          width: 120.r,
          height: 120.r,
          child: AvatarGenerator(
            seed: tokenKey,
            colors: themeService.randomIconColors,
            verticalTileCount: 3,
            horizontalTileCount: 3,
          ),
        ),
      );

  Widget getTokenIcon() {
    if (token == null) {
      return Container(
        width: 120.r,
        height: 120.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 5.r,
            color: themeService.textFieldBorderColor,
          ),
        ),
      );
    }

    if (token!.address.hexEip55 == OHOSettings.nativeTokenAddress) {
      return SvgPicture.asset(
        'assets/icons/network-${token!.networkKey}.svg',
        width: 120.r,
        height: 120.r,
      );
    }

    if (token!.iconUrl == null || token!.iconUrl!.isEmpty) {
      return randomIcon;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(9999),
      child: CachedNetworkImage(
        width: 120.r,
        height: 120.r,
        imageUrl: token!.iconUrl!,
        placeholder: (context, url) => randomIcon,
        errorWidget: (context, url, error) => randomIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => Get.to(
          () => TokenListScreen(getBackOnSelected: getBackOnSelected),
        ),
        child: Container(
          width: 700.w,
          height: 160.h,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: themeService.textFieldBackgroundColor,
            border: Border.all(
              width: 5.r,
              color: themeService.textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTokenIcon(),
              SizedBox(width: 20.w),
              Column(
                mainAxisAlignment: token == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 400.w,
                    child: OHOHeaderText(
                      token == null ? 'Select Token' : token!.name,
                      softWrap: false,
                      fontSize: 40.sp,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  token == null
                      ? Container()
                      : SizedBox(
                          width: 400.w,
                          child: OHOText(
                            controller.balanceString.value,
                            softWrap: false,
                            fontSize: 40.sp,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                ],
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 100.sp,
                color: themeService.textFieldBorderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
