// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockchain_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockchainNetwork _$BlockchainNetworkFromJson(Map<String, dynamic> json) =>
    BlockchainNetwork(
      keyName: json['keyName'] as String,
      networkName: json['networkName'] as String,
      rpcUrl: json['rpcUrl'] as String,
      chainId: BigInt.parse(json['chainId'] as String),
      currencySymbol: json['currencySymbol'] as String,
      blockExplorerUrl: json['blockExplorerUrl'] as String,
    );

Map<String, dynamic> _$BlockchainNetworkToJson(BlockchainNetwork instance) =>
    <String, dynamic>{
      'keyName': instance.keyName,
      'networkName': instance.networkName,
      'rpcUrl': instance.rpcUrl,
      'chainId': instance.chainId.toString(),
      'currencySymbol': instance.currencySymbol,
      'blockExplorerUrl': instance.blockExplorerUrl,
    };

BlockchainNetworkList _$BlockchainNetworkListFromJson(
        Map<String, dynamic> json) =>
    BlockchainNetworkList(
      blockchainNetworks: (json['blockchainNetworks'] as List<dynamic>)
          .map((e) => BlockchainNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockchainNetworkListToJson(
        BlockchainNetworkList instance) =>
    <String, dynamic>{
      'blockchainNetworks': instance.blockchainNetworks,
    };
