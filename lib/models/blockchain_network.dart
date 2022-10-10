import 'package:json_annotation/json_annotation.dart';

part 'blockchain_network.g.dart';

@JsonSerializable()
class BlockchainNetwork {
  bool locked;
  String networkName;
  String rpcUrl;
  BigInt chainId;
  String currencySymbol;
  String blockExplorerUrl;

  BlockchainNetwork({
    required this.locked,
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
