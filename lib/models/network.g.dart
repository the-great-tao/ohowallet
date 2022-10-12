// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
      name: json['name'] as String,
      rpcUrl: json['rpcUrl'] as String,
      chainId: BigInt.parse(json['chainId'] as String),
      currencySymbol: json['currencySymbol'] as String,
      blockExplorerUrl: json['blockExplorerUrl'] as String,
    );

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
      'name': instance.name,
      'rpcUrl': instance.rpcUrl,
      'chainId': instance.chainId.toString(),
      'currencySymbol': instance.currencySymbol,
      'blockExplorerUrl': instance.blockExplorerUrl,
    };

NetworkList _$NetworkListFromJson(Map<String, dynamic> json) => NetworkList(
      networks: (json['networks'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Network.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$NetworkListToJson(NetworkList instance) =>
    <String, dynamic>{
      'networks': instance.networks,
    };
