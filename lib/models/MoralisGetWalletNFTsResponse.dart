import 'package:json_annotation/json_annotation.dart';
part 'MoralisGetWalletNFTsResponse.g.dart';

@JsonSerializable()
class MoralisGetWalletNFTsResponseItem {
  @JsonKey(name: 'token_address')
  String? tokenAddress;

  @JsonKey(name: 'token_id')
  String? tokenId;

  @JsonKey(name: 'owner_of')
  String? ownerOf;

  @JsonKey(name: 'block_number')
  String? blockNumber;

  @JsonKey(name: 'block_number_minted')
  String? blockNumberMinted;

  @JsonKey(name: 'token_hash')
  String? tokenHash;


  @JsonKey(name: 'contract_type')
  String? contractType;


  @JsonKey(name: 'token_uri')
  String? tokenUri;

  @JsonKey(name: 'last_token_uri_sync')
  String? lastTokenUriSync;

  @JsonKey(name: 'last_metadata_sync')
  String? lastMetadataSync;

  String? amount;
  String? name;
  String? symbol;
  String? metadata;
  MoralisGetWalletNFTsResponseItemMetadata? nftItemMetadata;


  MoralisGetWalletNFTsResponseItem({this.tokenAddress, this.tokenId,
      this.ownerOf, this.blockNumber, this.blockNumberMinted, this.tokenHash,
      this.contractType, this.tokenUri, this.lastTokenUriSync,
      this.lastMetadataSync, this.amount, this.name, this.symbol,
      this.metadata,});

  factory MoralisGetWalletNFTsResponseItem.fromJson(
      Map<String, dynamic> json) =>
      _$MoralisGetWalletNFTsResponseItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoralisGetWalletNFTsResponseItemToJson(this);
}

@JsonSerializable()
class MoralisGetWalletNFTsResponseItemMetadata {
  String? name;
  String? description;
  String? image;

  @JsonKey(name: 'animation_url')
  String? animationUrl;

  @JsonKey(name: 'youtube_url')
  String? youtubeUrl;


  MoralisGetWalletNFTsResponseItemMetadata({this.name, this.description,
      this.image, this.animationUrl, this.youtubeUrl,});

  factory MoralisGetWalletNFTsResponseItemMetadata.fromJson(
      Map<String, dynamic> json) =>
      _$MoralisGetWalletNFTsResponseItemMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoralisGetWalletNFTsResponseItemMetadataToJson(this);
}

@JsonSerializable()
class MoralisGetWalletNFTsResponse {
  final int? total;
  final int? page;

  @JsonKey(name: 'page_size')
  final int? pageSize;

  final String? cursor;

  final List<MoralisGetWalletNFTsResponseItem>? result;

  MoralisGetWalletNFTsResponse({
    this.total,
    this.page,
    this.pageSize,
    this.cursor,
    this.result,
  });

  factory MoralisGetWalletNFTsResponse.fromJson(
      Map<String, dynamic> json) =>
      _$MoralisGetWalletNFTsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoralisGetWalletNFTsResponseToJson(this);
}
