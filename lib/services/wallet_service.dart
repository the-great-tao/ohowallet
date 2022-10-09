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
  static const alchemyApiKey = 'OGQhAKlTDHBObj8ENGTjmUzWRVKLAeFJ';
  static const rpcUrl =
      'https://polygon-mainnet.g.alchemy.com/v2/$alchemyApiKey';
  static const nftApiUrl =
      'https://polygon-mainnet.g.alchemyapi.io/nft/v2/$alchemyApiKey';

  late List<String> setupSeedPhrase;
  String? _accountPrivateKey;
  EthereumAddress? accountAddress;
  OnUpdateTransaction? onUpdateTransaction;

  final Web3Client web3client;

  WalletService() : web3client = Web3Client(rpcUrl, Client());

  Future<WalletService> init() async {
    final appDataService = Get.find<AppDataService>();
    final appDataBox = appDataService.appDataBox;
    if (appDataBox == null) return this;

    _accountPrivateKey = appDataBox.get('accountPrivateKey');
    final privateKey = EthPrivateKey.fromHex(_accountPrivateKey!);
    accountAddress = await privateKey.extractAddress();
    print('accountAddress: $accountAddress');

    return this;
  }

  Future<void> setup() async {
    final appDataService = Get.find<AppDataService>();
    final appDataBox = appDataService.appDataBox;
    if (appDataBox == null) return;

    if (setupSeedPhrase.isEmpty) return;
    final accountMnemonic = setupSeedPhrase.join(' ');
    await appDataBox.put('accountMnemonic', accountMnemonic);

    final accountPrivateKey =
        await WalletService.getPrivateKey(accountMnemonic);
    await appDataBox.put('accountPrivateKey', accountPrivateKey);

    setupSeedPhrase = [];
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

  // static ERC20 getERC20Token(EthereumAddress contractAddress) {
  //   return ERC20(
  //     address: contractAddress,
  //     client: Web3Client(rpcUrl, Client()),
  //   );
  // }

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

  Future<Map<String, dynamic>?> alchemyRpcCall({
    required String method,
    required Map<String, dynamic> params,
  }) async {
    try {
      var response = await Dio().post(
        rpcUrl,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
        data: jsonEncode({
          'id': 0,
          'jsonrpc': '2.0',
          'method': method,
          'params': params,
        }),
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

  Future<Map<String, dynamic>?> alchemyNftApiCall({
    required String method,
    required Map<String, dynamic> params,
  }) async {
    try {
      var response = await Dio().get(
        '$nftApiUrl/$method',
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
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

  Future<Map<String, dynamic>?> alchemyGetAssetTransfers({
    BlockNum? fromBlock,
    BlockNum? toBlock,
    EthereumAddress? fromAddress,
    EthereumAddress? toAddress,
    List<EthereumAddress>? contractAddresses,
    List<AlchemyAssetTransferCategory> categories = const [],
    String order = 'asc',
    int? maxCount,
    String? pageKey,
    bool excludeZeroValue = true,
    bool withMetadata = false,
  }) async {
    final Map<String, dynamic> params = {};
    final contractAddresses_ = [];
    final categories_ = [];

    if (fromBlock != null) {
      params['fromBlock'] = '0x${fromBlock.blockNum.toRadixString(16)}';
    }

    if (toBlock != null) {
      params['toBlock'] = '0x${toBlock.blockNum.toRadixString(16)}';
    }

    if (fromAddress != null) {
      params['fromAddress'] = fromAddress.hexEip55;
    }

    if (toAddress != null) {
      params['toAddress'] = toAddress.hexEip55;
    }

    if (contractAddresses != null) {
      for (var contractAddress in contractAddresses) {
        contractAddresses_.add(contractAddress.hexEip55);
      }
      params['contractAddresses'] = contractAddresses_;
    }

    for (var category_ in categories) {
      var category = category_.toString();
      var categoryRuntimeType = category_.runtimeType.toString();
      category = category.substring(categoryRuntimeType.length + 1);
      categories_.add(category);
    }
    params['category'] = categories_;

    params['order'] = order;

    if (maxCount != null) {
      params['maxCount'] = '0x${maxCount.toRadixString(16)}';
    }

    if (pageKey != null) {
      params['pageKey'] = pageKey;
    }

    params['excludeZeroValue'] = excludeZeroValue;

    params['withMetadata'] = withMetadata;

    return alchemyRpcCall(
      method: 'alchemy_getAssetTransfers',
      params: params,
    );
  }

  Future<Map<String, dynamic>?> alchemyGetNftsForOwner({
    required EthereumAddress owner,
    List<EthereumAddress>? contractAddresses,
    String? pageKey,
    int? pageSize,
    bool withMetadata = true,
    int? tokenUriTimeoutInMs,
    List<String>? filters,
  }) async {
    final Map<String, dynamic> params = {};
    final contractAddresses_ = [];

    params['owner'] = owner.hexEip55;

    if (contractAddresses != null) {
      for (var contractAddress in contractAddresses) {
        contractAddresses_.add(contractAddress.hexEip55);
      }
      params['contractAddresses[]'] = contractAddresses_;
    }

    if (pageKey != null) {
      params['pageKey'] = pageKey;
    }

    if (pageSize != null) {
      params['pageSize'] = pageSize;
    }

    params['withMetadata'] = withMetadata;

    if (tokenUriTimeoutInMs != null) {
      params['tokenUriTimeoutInMs'] = tokenUriTimeoutInMs;
    }

    if (filters != null) {
      params['filters'] = filters;
    }

    return alchemyNftApiCall(
      method: 'getNFTs',
      params: params,
    );
  }

  Future<Map<String, dynamic>?> alchemyGetNftMetadata({
    required EthereumAddress contractAddress,
    required BigInt tokenId,
    String? tokenType,
    int? tokenUriTimeoutInMs,
    bool refreshCache = false,
  }) async {
    final Map<String, dynamic> params = {};

    params['contractAddress'] = contractAddress.hexEip55;

    params['tokenId'] = tokenId.toString();

    if (tokenType != null) {
      params['tokenType'] = tokenType;
    }

    if (tokenUriTimeoutInMs != null) {
      params['tokenUriTimeoutInMs'] = tokenUriTimeoutInMs;
    }

    params['refreshCache'] = refreshCache;

    return alchemyNftApiCall(
      method: 'getNFTMetadata',
      params: params,
    );
  }
}
