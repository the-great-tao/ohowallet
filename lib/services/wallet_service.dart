import 'package:ohowallet/core/exports.dart';

enum OHOTransactionStatus {
  none,
  sending,
  pending,
  pendingHistory,
  successful,
  failed,
}

const ohoTransactionStatusStringMap = {
  OHOTransactionStatus.none: 'None',
  OHOTransactionStatus.sending: 'Sending',
  OHOTransactionStatus.pending: 'Pending',
  OHOTransactionStatus.pendingHistory: 'Pending',
  OHOTransactionStatus.successful: 'Successful',
  OHOTransactionStatus.failed: 'Failed',
};

enum OHOTransactionType {
  none,
  swapToken,
  sendToken,
  sendNFT,
}

const ohoTransactionTypeStringMap = {
  OHOTransactionType.none: 'None',
  OHOTransactionType.swapToken: 'Swap Token',
  OHOTransactionType.sendToken: 'Send Token',
  OHOTransactionType.sendNFT: 'Send NFT',
};

enum AlchemyAssetTransferCategory {
  external,
  internal,
  erc20,
  erc721,
  erc1155,
  specialnft,
}

typedef OnUpdateTransaction = Future<void> Function({
  OHOTransactionStatus? status,
  OHOTransactionType? type,
  String? tokenSymbol,
  double? tokenAmount,
  int? tokenDecimals,
  BigInt? tokenId,
  String? from,
  String? to,
  String? hash,
  DateTime? date,
  BigInt? gasUsed,
  double? feeCharged,
  Network? network,
});

Future<void> openTransactionDetailsScreen() async {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        vertical: 300.h,
        horizontal: 50.w,
      ),
      child: TransactionDetailsScreen()..controller.resetData(),
    ),
  );
}

class WalletService extends GetxService {
  static const accountsKey = 'appSettings-accounts';
  static const defaultAccountKey = 'appSettings-defaultAccount';
  static const selectedAccountKey = 'appSettings-selectedAccount';

  static const customNetworksKey = 'appSettings-customNetworks';
  static const selectedNetworkKey = 'appSettings-selectedNetwork';

  static const tokensKey = 'appSettings-tokens';
  static const contactsKey = 'appSettings-contacts';

  late List<String> setupSeedPhrase;

  Box? appDataBox;

  var accounts = AccountList(accounts: {}).obs;
  var defaultAccount = ''.obs;
  var selectedAccount = ''.obs;
  Account? selectedAccountInstance;

  var defaultNetworks = NetworkList(networks: {}).obs;
  var customNetworks = NetworkList(networks: {}).obs;
  var selectedNetwork = OHOSettings.defaultNetworkKey.obs;
  Network? selectedNetworkInstance;

  var tokens = TokenList(tokens: {}).obs;
  var contacts = ContactList(contacts: {}).obs;

  OnUpdateTransaction? onUpdateTransaction;

  Future<WalletService> init() async {
    final appDataService = Get.find<AppDataService>();
    appDataBox = appDataService.appDataBox;
    if (appDataBox == null) return this;

    // accounts.value = AccountList(accounts: {});
    // storeAccounts();

    final accountsJson = await appDataBox?.get(
      accountsKey,
      defaultValue: '{"accounts":{}}',
    );
    accounts.value = AccountList.fromJson(jsonDecode(accountsJson));

    final defaultAccount_ = await appDataBox?.get(defaultAccountKey);
    if (defaultAccount_ != null) {
      defaultAccount.value = defaultAccount_;
    } else {
      await storeDefaultAccount();
    }

    final selectedAccount_ = await appDataBox?.get(selectedAccountKey);
    if (selectedAccount_ != null) {
      selectedAccount.value = selectedAccount_;
      await getSelectedAccount();
    } else {
      await storeSelectedAccount();
    }

    final defaultNetworksJson =
        await rootBundle.loadString('assets/default_networks.json');
    defaultNetworks.value =
        NetworkList.fromJson(jsonDecode(defaultNetworksJson));

    // customNetworks.value = NetworkList(networks: {});
    // storeCustomNetworks();

    final customNetworksJson = await appDataBox?.get(
      customNetworksKey,
      defaultValue: '{"networks":{}}',
    );
    customNetworks.value = NetworkList.fromJson(jsonDecode(customNetworksJson));

    final selectedNetwork_ = await appDataBox?.get(selectedNetworkKey);
    if (selectedNetwork_ != null) {
      selectedNetwork.value = selectedNetwork_;
      await getSelectedNetwork();
    } else {
      await storeSelectedNetwork();
    }

    // tokens.value = TokenList(tokens: {});
    // storeTokens();

    final tokensJson = await appDataBox?.get(
      tokensKey,
      defaultValue: '{"tokens":{}}',
    );
    tokens.value = TokenList.fromJson(jsonDecode(tokensJson));

    // contacts.value = ContactList(contacts: {});
    // storeContacts();

    final contactsJson = await appDataBox?.get(
      contactsKey,
      defaultValue: '{"contacts":{}}',
    );
    contacts.value = ContactList.fromJson(jsonDecode(contactsJson));

    return this;
  }

  bool get isSelectedDefaultNetwork =>
      selectedNetworkInstance ==
      defaultNetworks.value.networks[selectedNetwork.value];

  Future<Account?> getSelectedAccount() async {
    selectedAccountInstance = accounts.value.accounts[selectedAccount.value];
    return selectedAccountInstance;
  }

  Future<Network?> getSelectedNetwork() async {
    selectedNetworkInstance =
        defaultNetworks.value.networks[selectedNetwork.value] ??
            customNetworks.value.networks[selectedNetwork.value];
    print('selectedNetworkInstance: ${selectedNetworkInstance?.toJson()}');
    return selectedNetworkInstance;
  }

  Network? getNetworkByKey(String networkKey) {
    final network = defaultNetworks.value.networks[networkKey] ??
        customNetworks.value.networks[networkKey];
    return network;
  }

  Future<void> setDefaultAccount(String account) async {
    defaultAccount.value = account;
    await storeDefaultAccount();
  }

  Future<void> setSelectedAccount(String account) async {
    selectedAccount.value = account;
    await getSelectedAccount();
    await storeSelectedAccount();
  }

  Future<void> setSelectedNetwork(String network) async {
    selectedNetwork.value = network;
    await getSelectedNetwork();
    await storeSelectedNetwork();
  }

  Future<void> storeDefaultAccount() async {
    await appDataBox?.put(defaultAccountKey, defaultAccount.value);
  }

  Future<void> storeSelectedAccount() async {
    await appDataBox?.put(selectedAccountKey, selectedAccount.value);
  }

  Future<void> storeSelectedNetwork() async {
    await appDataBox?.put(selectedNetworkKey, selectedNetwork.value);
  }

  Future<void> storeAccounts() async {
    await appDataBox?.put(
      accountsKey,
      jsonEncode(accounts.value.toJson()),
    );
  }

  Future<void> storeCustomNetworks() async {
    await appDataBox?.put(
      customNetworksKey,
      jsonEncode(customNetworks.value.toJson()),
    );
  }

  Future<void> storeTokens() async {
    await appDataBox?.put(
      tokensKey,
      jsonEncode(tokens.value.toJson()),
    );
  }

  Future<void> storeContacts() async {
    await appDataBox?.put(
      contactsKey,
      jsonEncode(contacts.value.toJson()),
    );
  }

  Future<void> setup() async {
    final appDataService = Get.find<AppDataService>();
    appDataBox = appDataService.appDataBox;
    if (appDataBox == null) return;

    if (setupSeedPhrase.isEmpty) return;

    final mnemonic = setupSeedPhrase.join(' ');
    final privateKey = await WalletService.getPrivateKey(mnemonic);
    final address = await WalletService.getPublicKey(privateKey);
    final account = Account(
      name: 'Account 1',
      mnemonic: mnemonic,
      privateKey: privateKey,
      address: address,
      removable: false,
    );
    final accountKey = address.hexEip55;

    setupSeedPhrase = [];
    accounts.value.accounts[accountKey] = account;

    await setDefaultAccount(accountKey);
    await setSelectedAccount(accountKey);
    await storeAccounts();

    await setSelectedNetwork(OHOSettings.defaultNetworkKey);
    await storeCustomNetworks();

    final tokens_ = tokens.value.tokens;
    final defaultNetworks_ = defaultNetworks.value.networks;
    for (var networkKey in defaultNetworks_.keys) {
      final network = defaultNetworks_[networkKey]!;
      const tokenAddress = OHOSettings.nativeTokenAddress;
      final tokenKey = '$networkKey-$tokenAddress';
      final tokens = {
        tokenKey: Token(
          networkKey: networkKey,
          address: EthereumAddress.fromHex(tokenAddress),
          name: '${network.currencySymbol} Native Token',
          symbol: network.currencySymbol,
          decimals: OHOSettings.nativeTokenDecimals,
          iconUrl: OHOSettings.nativeTokenAddress,
        ),
      };
      tokens_[networkKey] = tokens;
    }
    await storeTokens();
  }

  static Future<String> getPrivateKey(String mnemonic) async {
    final seed = mnemonicToSeed(mnemonic);
    final masterKey = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = bytesToHex(masterKey.key);
    return privateKey;
  }

  static Future<EthereumAddress> getPublicKey(String privateKey) async {
    final privateKey_ = EthPrivateKey.fromHex(privateKey);
    final address = await privateKey_.extractAddress();
    return address;
  }

  static EthereumAddress? isValidAddress(String address) {
    try {
      return EthereumAddress.fromHex(address);
    } catch (error) {
      return null;
    }
  }

  static String getShortHex(
    String hex, {
    int partLength = 10,
  }) {
    return '${hex.substring(0, partLength + 2)}...${hex.substring(hex.length - partLength)}';
  }

  static ERC20 getERC20Token({
    required EthereumAddress contractAddress,
    required String rpcUrl,
    int? chainId,
  }) {
    return ERC20(
      address: contractAddress,
      client: Web3Client(rpcUrl, Client()),
      chainId: chainId,
    );
  }

  Future<void> updateTransaction({
    OHOTransactionStatus? status,
    OHOTransactionType? type,
    String? tokenSymbol,
    double? tokenAmount,
    int? tokenDecimals,
    BigInt? tokenId,
    String? from,
    String? to,
    String? hash,
    DateTime? date,
    BigInt? gasUsed,
    double? feeCharged,
    Network? network,
  }) async {
    if (onUpdateTransaction == null) return;
    onUpdateTransaction!(
      status: status,
      type: type,
      tokenSymbol: tokenSymbol,
      tokenAmount: tokenAmount,
      tokenDecimals: tokenDecimals,
      tokenId: tokenId,
      from: from,
      to: to,
      hash: hash,
      date: date,
      gasUsed: gasUsed,
      feeCharged: feeCharged,
      network: network,
    );
  }

// Future<Map<String, dynamic>?> alchemyRpcCall({
//   required String method,
//   required Map<String, dynamic> params,
// }) async {
//   try {
//     var response = await Dio().post(
//       rpcUrl,
//       options: Options(headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       }),
//       data: jsonEncode({
//         'id': 0,
//         'jsonrpc': '2.0',
//         'method': method,
//         'params': params,
//       }),
//     );
//     print(response);
//     return jsonDecode(response.toString());
//   } on DioError catch (error) {
//     print(error.response);
//     return null;
//   } catch (error) {
//     print(error);
//     return null;
//   }
// }

  String? getMoralisChainByNetworkKey(String? networkKey) {
    if (networkKey == null) return null;
    switch (networkKey) {
      case 'ethereum':
        return 'eth';
      case 'binance':
        return 'bsc';
      case 'polygon':
        return 'polygon';
      case 'fantom':
        return 'fantom';
      case 'avalanche':
        return 'avalanche';
      default:
        return null;
    }
  }

  Future<Map<String, dynamic>?> moralisAPICall({
    required String path,
    required Map<String, dynamic> params,
  }) async {
    try {
      var response = await Dio().get(
        '${OHOSettings.moralisBaseURL}/$path',
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=utf-8',
          'X-API-Key': OHOSettings.moralisAPIKey,
        }),
        queryParameters: params,
      );
      print(response);
      return jsonDecode(response.toString());
    } on DioError catch (error) {
      print(error.response);
      return null;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<Map<String, dynamic>?> moralisGetNFTsByWallet({
    EthereumAddress? address,
    String? chain,
    String format = 'decimal',
    List<EthereumAddress>? tokenAddresses,
    int limit = 10,
    String? cursor,
  }) async {
    final Map<String, dynamic> params = {};
    final tokenAddresses_ = [];

    final networkKey = selectedNetwork.value;
    final account = selectedAccountInstance!;
    final accountAddress = address ?? account.address.hexEip55;

    params['chain'] = chain ?? getMoralisChainByNetworkKey(networkKey);

    params['format'] = format;

    if (tokenAddresses != null) {
      for (var tokenAddress in tokenAddresses) {
        tokenAddresses_.add(tokenAddress.hexEip55);
      }
      params['token_addresses'] = tokenAddresses_;
    }

    params['limit'] = limit;

    if (cursor != null) {
      params['cursor'] = cursor;
    }

    return moralisAPICall(
      path: '$accountAddress/nft',
      params: params,
    );
  }
}
