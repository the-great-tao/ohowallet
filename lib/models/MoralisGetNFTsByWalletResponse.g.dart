// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoralisGetNFTsByWalletResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NFTMetadata _$NFTMetadataFromJson(Map<String, dynamic> json) => NFTMetadata(
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NFTMetadataToJson(NFTMetadata instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };

MoralisGetNFTsByWalletResultItem _$MoralisGetNFTsByWalletResultItemFromJson(
        Map<String, dynamic> json) =>
    MoralisGetNFTsByWalletResultItem(
      tokenAddress: const EthereumAddressJsonConverter()
          .fromJson(json['token_address'] as String?),
      tokenId: json['token_id'] == null
          ? null
          : BigInt.parse(json['token_id'] as String),
      ownerOf: const EthereumAddressJsonConverter()
          .fromJson(json['owner_of'] as String?),
      blockNumber: json['block_number'] == null
          ? null
          : BigInt.parse(json['block_number'] as String),
      blockNumberMinted: json['block_number_minted'] == null
          ? null
          : BigInt.parse(json['block_number_minted'] as String),
      tokenHash: json['token_hash'] as String?,
      amount: json['amount'] == null
          ? null
          : BigInt.parse(json['amount'] as String),
      contractType: json['contract_type'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      tokenUri: json['token_uri'] as String?,
      metadata: json['metadata'] as String?,
      lastTokenUriSync: json['last_token_uri_sync'] == null
          ? null
          : DateTime.parse(json['last_token_uri_sync'] as String),
      lastMetadataSync: json['last_metadata_sync'] == null
          ? null
          : DateTime.parse(json['last_metadata_sync'] as String),
      minterAddress: const EthereumAddressJsonConverter()
          .fromJson(json['minter_address'] as String?),
    );

Map<String, dynamic> _$MoralisGetNFTsByWalletResultItemToJson(
        MoralisGetNFTsByWalletResultItem instance) =>
    <String, dynamic>{
      'token_address':
          const EthereumAddressJsonConverter().toJson(instance.tokenAddress),
      'token_id': instance.tokenId?.toString(),
      'owner_of': const EthereumAddressJsonConverter().toJson(instance.ownerOf),
      'block_number': instance.blockNumber?.toString(),
      'block_number_minted': instance.blockNumberMinted?.toString(),
      'token_hash': instance.tokenHash,
      'amount': instance.amount?.toString(),
      'contract_type': instance.contractType,
      'name': instance.name,
      'symbol': instance.symbol,
      'token_uri': instance.tokenUri,
      'metadata': instance.metadata,
      'last_token_uri_sync': instance.lastTokenUriSync?.toIso8601String(),
      'last_metadata_sync': instance.lastMetadataSync?.toIso8601String(),
      'minter_address':
          const EthereumAddressJsonConverter().toJson(instance.minterAddress),
    };

MoralisGetNFTsByWalletResponse _$MoralisGetNFTsByWalletResponseFromJson(
        Map<String, dynamic> json) =>
    MoralisGetNFTsByWalletResponse(
      total: json['total'] as int?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
      status: json['status'] as String?,
      cursor: json['cursor'] as String?,
    )..result = (json['result'] as List<dynamic>?)
        ?.map((e) => MoralisGetNFTsByWalletResultItem.fromJson(
            e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$MoralisGetNFTsByWalletResponseToJson(
        MoralisGetNFTsByWalletResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'cursor': instance.cursor,
      'status': instance.status,
      'result': instance.result,
    };
