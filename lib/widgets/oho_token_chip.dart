import 'package:ohowallet/core/exports.dart';

class OHOTokenChipController extends BaseController {
  final String tokenKey;
  final Token token;
  var loading = false.obs;
  var decimals = BigInt.zero.obs;
  var balance = BigInt.zero.obs;
  var balanceString = '...'.obs;

  OHOTokenChipController({
    required this.tokenKey,
    required this.token,
  }) : super();

  Future<void> refreshToken() async {
    final network = walletService.getNetworkByKey(token.networkKey);
    final selectedAccount = walletService.selectedAccountInstance;
    if (network == null || selectedAccount == null) {
      return;
    }

    balanceString.value = '...';
    loading.value = true;
    if (token.address.hexEip55 == OHOSettings.nativeTokenAddress) {
      final web3Client = Web3Client(network.rpcUrl, Client());
      decimals.value = BigInt.from(OHOSettings.nativeTokenDecimals);
      balance.value =
          (await web3Client.getBalance(selectedAccount.address)).getInWei;
    } else {
      final token_ = WalletService.getERC20Token(
        contractAddress: token.address,
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
  final Token token;

  OHOTokenChip({
    super.key,
    super.tag,
    required this.tokenKey,
    required this.token,
  }) : super(
          controller: OHOTokenChipController(
            tokenKey: tokenKey,
            token: token,
          ),
        );

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
    return token.address.hexEip55 == OHOSettings.nativeTokenAddress
        ? SvgPicture.asset(
            'assets/icons/network-${token.networkKey}.svg',
            width: 120.r,
            height: 120.r,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(9999),
            child: CachedNetworkImage(
              width: 120.r,
              height: 120.r,
              imageUrl: token.iconUrl!,
              placeholder: (context, url) => randomIcon,
              errorWidget: (context, url, error) => randomIcon,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => Get.to(() => TokenListScreen()),
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
              token.iconUrl == null || token.iconUrl!.isEmpty
                  ? randomIcon
                  : getTokenIcon(),
              SizedBox(width: 20.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 400.w,
                    child: OHOHeaderText(
                      token.name,
                      softWrap: false,
                      fontSize: 40.sp,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
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
              // SizedBox(width: 20.r),
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
