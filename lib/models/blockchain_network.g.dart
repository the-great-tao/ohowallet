// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockchain_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockchainNetwork _$BlockchainNetworkFromJson(Map<String, dynamic> json) =>
    BlockchainNetwork(
      locked: json['locked'] as bool,
      networkName: json['networkName'] as String,
      rpcUrl: json['rpcUrl'] as String,
      chainId: BigInt.parse(json['chainId'] as String),
      currencySymbol: json['currencySymbol'] as String,
      blockExplorerUrl: json['blockExplorerUrl'] as String,
    );

Map<String, dynamic> _$BlockchainNetworkToJson(BlockchainNetwork instance) =>
    <String, dynamic>{
      'locked': instance.locked,
      'networkName': instance.networkName,
      'rpcUrl': instance.rpcUrl,
      'chainId': instance.chainId.toString(),
      'currencySymbol': instance.currencySymbol,
      'blockExplorerUrl': instance.blockExplorerUrl,
    };
