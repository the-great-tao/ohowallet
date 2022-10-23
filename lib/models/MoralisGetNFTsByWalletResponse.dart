import 'package:ohowallet/core/exports.dart';

part 'MoralisGetNFTsByWalletResponse.g.dart';

@JsonSerializable()
class NFTMetadata {
  String? name;
  String? description;
  String? image;

  NFTMetadata({
    this.name,
    this.description,
    this.image,
  });

  factory NFTMetadata.fromJson(Map<String, dynamic> json) =>
      _$NFTMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$NFTMetadataToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  converters: [EthereumAddressJsonConverter()],
)
class MoralisGetNFTsByWalletResultItem {
  EthereumAddress? tokenAddress;
  BigInt? tokenId;
  EthereumAddress? ownerOf;
  BigInt? blockNumber;
  BigInt? blockNumberMinted;
  String? tokenHash;
  BigInt? amount;
  String? contractType;
  String? name;
  String? symbol;
  String? tokenUri;
  String? metadata;
  DateTime? lastTokenUriSync;
  DateTime? lastMetadataSync;
  EthereumAddress? minterAddress;

  @JsonKey(ignore: true)
  NFTMetadata? metadata_;

  MoralisGetNFTsByWalletResultItem({
    this.tokenAddress,
    this.tokenId,
    this.ownerOf,
    this.blockNumber,
    this.blockNumberMinted,
    this.tokenHash,
    this.amount,
    this.contractType,
    this.name,
    this.symbol,
    this.tokenUri,
    this.metadata,
    this.lastTokenUriSync,
    this.lastMetadataSync,
    this.minterAddress,
  });

  factory MoralisGetNFTsByWalletResultItem.fromJson(
          Map<String, dynamic> json) =>
      _$MoralisGetNFTsByWalletResultItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoralisGetNFTsByWalletResultItemToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MoralisGetNFTsByWalletResponse {
  int? total;
  int? page;
  int? pageSize;
  String? cursor;
  String? status;
  List<MoralisGetNFTsByWalletResultItem>? result;

  MoralisGetNFTsByWalletResponse({
    this.total,
    this.page,
    this.pageSize,
    this.status,
    this.cursor,
  });

  factory MoralisGetNFTsByWalletResponse.fromJson(Map<String, dynamic> json) =>
      _$MoralisGetNFTsByWalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoralisGetNFTsByWalletResponseToJson(this);
}
