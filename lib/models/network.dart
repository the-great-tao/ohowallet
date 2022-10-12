import 'package:ohowallet/core/exports.dart';

part 'network.g.dart';

@JsonSerializable()
class Network {
  String name;
  String rpcUrl;
  BigInt chainId;
  String currencySymbol;
  String blockExplorerUrl;

  Network({
    required this.name,
    required this.rpcUrl,
    required this.chainId,
    required this.currencySymbol,
    required this.blockExplorerUrl,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}

@JsonSerializable()
class NetworkList {
  Map<String, Network> networks;

  NetworkList({
    required this.networks,
  });

  factory NetworkList.fromJson(Map<String, dynamic> json) =>
      _$NetworkListFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkListToJson(this);
}
