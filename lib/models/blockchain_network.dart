import 'package:json_annotation/json_annotation.dart';

part 'blockchain_network.g.dart';

@JsonSerializable()
class BlockchainNetwork {
  String keyName;
  String networkName;
  String rpcUrl;
  BigInt chainId;
  String currencySymbol;
  String blockExplorerUrl;

  BlockchainNetwork({
    required this.keyName,
    required this.networkName,
    required this.rpcUrl,
    required this.chainId,
    required this.currencySymbol,
    required this.blockExplorerUrl,
  });

  factory BlockchainNetwork.fromJson(Map<String, dynamic> json) =>
      _$BlockchainNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$BlockchainNetworkToJson(this);
}

@JsonSerializable()
class BlockchainNetworkList {
  List<BlockchainNetwork> blockchainNetworks;

  BlockchainNetworkList({
    required this.blockchainNetworks,
  });

  factory BlockchainNetworkList.fromJson(Map<String, dynamic> json) =>
      _$BlockchainNetworkListFromJson(json);

  Map<String, dynamic> toJson() => _$BlockchainNetworkListToJson(this);
}
