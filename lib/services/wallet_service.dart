import 'package:ohowallet/core/exports.dart';

enum OHOTransactionStatus {
  none,
  sending,
  pending,
  successful,
  failed,
}

enum OHOTransactionType {
  none,
  swapToken,
  sendToken,
  sendNFT,
}

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
  double? tokenAmount,
  int? tokenDecimals,
  String? tokenName,
  BigInt? tokenId,
  String? from,
  String? to,
  String? hash,
  DateTime? date,
  BigInt? gasUsed,
  double? feeCharged,
});

class WalletService extends GetxService {
  static const selectedAccountKey = 'appSettings-selectedAccount';
  static const accountsKey = 'appSettings-accounts';

  static const selectedNetworkKey = 'appSettings-selectedNetwork';
  static const customNetworksKey = 'appSettings-customNetworks';

  static const tokensKey = 'appSettings-tokens';
  static const contactsKey = 'appSettings-contacts';

  late List<String> setupSeedPhrase;

  Box? appDataBox;

  var accounts = AccountList(accounts: {}).obs;
  var selectedAccount = ''.obs;
  Account? selectedAccountInstance;

  var defaultNetworks = NetworkList(networks: {}).obs;
  var customNetworks = NetworkList(networks: {}).obs;
  var selectedNetwork = 'ethereum'.obs;
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

    contacts.value = ContactList(contacts: {});
    storeContacts();

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

    setupSeedPhrase = [];
    accounts.value.accounts[account.address.hexEip55] = account;

    await setSelectedAccount(account.address.hexEip55);
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
    double? tokenAmount,
    int? tokenDecimals,
    String? tokenName,
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
      tokenAmount: tokenAmount,
      tokenDecimals: tokenDecimals,
      tokenName: tokenName,
      tokenId: tokenId,
      from: from,
      to: to,
      hash: hash,
      date: date,
      gasUsed: gasUsed,
      feeCharged: feeCharged,
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
//
// Future<Map<String, dynamic>?> alchemyNftApiCall({
//   required String method,
//   required Map<String, dynamic> params,
// }) async {
//   try {
//     var response = await Dio().get(
//       '$nftApiUrl/$method',
//       options: Options(headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       }),
//       queryParameters: params,
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
//
// Future<Map<String, dynamic>?> alchemyGetAssetTransfers({
//   BlockNum? fromBlock,
//   BlockNum? toBlock,
//   EthereumAddress? fromAddress,
//   EthereumAddress? toAddress,
//   List<EthereumAddress>? contractAddresses,
//   List<AlchemyAssetTransferCategory> categories = const [],
//   String order = 'asc',
//   int? maxCount,
//   String? pageKey,
//   bool excludeZeroValue = true,
//   bool withMetadata = false,
// }) async {
//   final Map<String, dynamic> params = {};
//   final contractAddresses_ = [];
//   final categories_ = [];
//
//   if (fromBlock != null) {
//     params['fromBlock'] = '0x${fromBlock.blockNum.toRadixString(16)}';
//   }
//
//   if (toBlock != null) {
//     params['toBlock'] = '0x${toBlock.blockNum.toRadixString(16)}';
//   }
//
//   if (fromAddress != null) {
//     params['fromAddress'] = fromAddress.hexEip55;
//   }
//
//   if (toAddress != null) {
//     params['toAddress'] = toAddress.hexEip55;
//   }
//
//   if (contractAddresses != null) {
//     for (var contractAddress in contractAddresses) {
//       contractAddresses_.add(contractAddress.hexEip55);
//     }
//     params['contractAddresses'] = contractAddresses_;
//   }
//
//   for (var category_ in categories) {
//     var category = category_.toString();
//     var categoryRuntimeType = category_.runtimeType.toString();
//     category = category.substring(categoryRuntimeType.length + 1);
//     categories_.add(category);
//   }
//   params['category'] = categories_;
//
//   params['order'] = order;
//
//   if (maxCount != null) {
//     params['maxCount'] = '0x${maxCount.toRadixString(16)}';
//   }
//
//   if (pageKey != null) {
//     params['pageKey'] = pageKey;
//   }
//
//   params['excludeZeroValue'] = excludeZeroValue;
//
//   params['withMetadata'] = withMetadata;
//
//   return alchemyRpcCall(
//     method: 'alchemy_getAssetTransfers',
//     params: params,
//   );
// }
//
// Future<Map<String, dynamic>?> alchemyGetNftsForOwner({
//   required EthereumAddress owner,
//   List<EthereumAddress>? contractAddresses,
//   String? pageKey,
//   int? pageSize,
//   bool withMetadata = true,
//   int? tokenUriTimeoutInMs,
//   List<String>? filters,
// }) async {
//   final Map<String, dynamic> params = {};
//   final contractAddresses_ = [];
//
//   params['owner'] = owner.hexEip55;
//
//   if (contractAddresses != null) {
//     for (var contractAddress in contractAddresses) {
//       contractAddresses_.add(contractAddress.hexEip55);
//     }
//     params['contractAddresses[]'] = contractAddresses_;
//   }
//
//   if (pageKey != null) {
//     params['pageKey'] = pageKey;
//   }
//
//   if (pageSize != null) {
//     params['pageSize'] = pageSize;
//   }
//
//   params['withMetadata'] = withMetadata;
//
//   if (tokenUriTimeoutInMs != null) {
//     params['tokenUriTimeoutInMs'] = tokenUriTimeoutInMs;
//   }
//
//   if (filters != null) {
//     params['filters'] = filters;
//   }
//
//   return alchemyNftApiCall(
//     method: 'getNFTs',
//     params: params,
//   );
// }
//
// Future<Map<String, dynamic>?> alchemyGetNftMetadata({
//   required EthereumAddress contractAddress,
//   required BigInt tokenId,
//   String? tokenType,
//   int? tokenUriTimeoutInMs,
//   bool refreshCache = false,
// }) async {
//   final Map<String, dynamic> params = {};
//
//   params['contractAddress'] = contractAddress.hexEip55;
//
//   params['tokenId'] = tokenId.toString();
//
//   if (tokenType != null) {
//     params['tokenType'] = tokenType;
//   }
//
//   if (tokenUriTimeoutInMs != null) {
//     params['tokenUriTimeoutInMs'] = tokenUriTimeoutInMs;
//   }
//
//   params['refreshCache'] = refreshCache;
//
//   return alchemyNftApiCall(
//     method: 'getNFTMetadata',
//     params: params,
//   );
// }
}
