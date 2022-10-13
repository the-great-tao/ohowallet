// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoralisGetWalletNFTsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoralisGetWalletNFTsResponseItem _$MoralisGetWalletNFTsResponseItemFromJson(
    Map<String, dynamic> json) =>
    MoralisGetWalletNFTsResponseItem(
          tokenAddress: json['token_address'] as String?,
          tokenId: json['token_id'] as String?,
          ownerOf: json['owner_of'] as String?,
          blockNumber: json['block_number'] as String?,
          blockNumberMinted: json['block_number_minted'] as String?,
          tokenHash: json['token_hash'] as String?,
          contractType: json['contract_type'] as String?,
          tokenUri: json['token_uri'] as String?,
          lastTokenUriSync: json['last_token_uri_sync'] as String?,
          lastMetadataSync: json['last_metadata_sync'] as String?,
          amount: json['amount'] as String?,
          name: json['name'] as String?,
          symbol: json['symbol'] as String?,
          metadata: json['metadata'] as String?,
    )..nftItemMetadata = json['nftItemMetadata'] == null
        ? null
        : MoralisGetWalletNFTsResponseItemMetadata.fromJson(
        json['nftItemMetadata'] as Map<String, dynamic>);

Map<String, dynamic> _$MoralisGetWalletNFTsResponseItemToJson(
    MoralisGetWalletNFTsResponseItem instance) =>
    <String, dynamic>{
          'token_address': instance.tokenAddress,
          'token_id': instance.tokenId,
          'owner_of': instance.ownerOf,
          'block_number': instance.blockNumber,
          'block_number_minted': instance.blockNumberMinted,
          'token_hash': instance.tokenHash,
          'contract_type': instance.contractType,
          'token_uri': instance.tokenUri,
          'last_token_uri_sync': instance.lastTokenUriSync,
          'last_metadata_sync': instance.lastMetadataSync,
          'amount': instance.amount,
          'name': instance.name,
          'symbol': instance.symbol,
          'metadata': instance.metadata,
          'nftItemMetadata': instance.nftItemMetadata,
    };

MoralisGetWalletNFTsResponseItemMetadata
_$MoralisGetWalletNFTsResponseItemMetadataFromJson(
    Map<String, dynamic> json) =>
    MoralisGetWalletNFTsResponseItemMetadata(
          name: json['name'] as String?,
          description: json['description'] as String?,
          image: json['image'] as String?,
          animationUrl: json['animation_url'] as String?,
          youtubeUrl: json['youtube_url'] as String?,
    );

Map<String, dynamic> _$MoralisGetWalletNFTsResponseItemMetadataToJson(
    MoralisGetWalletNFTsResponseItemMetadata instance) =>
    <String, dynamic>{
          'name': instance.name,
          'description': instance.description,
          'image': instance.image,
          'animation_url': instance.animationUrl,
          'youtube_url': instance.youtubeUrl,
    };

MoralisGetWalletNFTsResponse _$MoralisGetWalletNFTsResponseFromJson(
    Map<String, dynamic> json) =>
    MoralisGetWalletNFTsResponse(
          total: json['total'] as int?,
          page: json['page'] as int?,
          pageSize: json['page_size'] as int?,
          cursor: json['cursor'] as String?,
          result: (json['result'] as List<dynamic>?)
              ?.map((e) => MoralisGetWalletNFTsResponseItem.fromJson(
              e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MoralisGetWalletNFTsResponseToJson(
    MoralisGetWalletNFTsResponse instance) =>
    <String, dynamic>{
          'total': instance.total,
          'page': instance.page,
          'page_size': instance.pageSize,
          'cursor': instance.cursor,
          'result': instance.result,
    };
