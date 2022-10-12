import 'package:json_annotation/json_annotation.dart';

part 'MoralisGetWalletTransactionsResponse.g.dart';

@JsonSerializable()
class MoralisGetWalletTransactionsItem {
  @JsonKey(name: 'transaction_hash')
  String? transactionHash;

  String? address;

  @JsonKey(name: 'block_timestamp')
  String? blockTimestamp;

  @JsonKey(name: 'block_number')
  String? blockNumber;

  @JsonKey(name: 'block_hash')
  String? blockHash;

  @JsonKey(name: 'from_address')
  String? fromAddress;

  @JsonKey(name: 'to_address')
  String? toAddress;


  BigInt? value;
  String? formatedTime;
  MoralisGetWalletTransactionsItemMetadata? metadata;
  double? amountSentReceived;

  MoralisGetWalletTransactionsItem({
    this.transactionHash,
    this.address,
    this.blockTimestamp,
    this.blockNumber,
    this.blockHash,
    this.fromAddress,
    this.toAddress,
    this.value,
  });

  factory MoralisGetWalletTransactionsItem.fromJson(
      Map<String, dynamic> json) =>
      _$MoralisGetWalletTransactionsItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoralisGetWalletTransactionsItemToJson(this);
}

@JsonSerializable()
class MoralisGetWalletTransactionsItemMetadata {
  String? address;
  String? name;
  String? symbol;
  String? decimals;

  int? validated;

  MoralisGetWalletTransactionsItemMetadata({
    this.address,
    this.name,
    this.symbol,
    this.decimals,
    this.validated,
  });

  factory MoralisGetWalletTransactionsItemMetadata.fromJson(
      Map<String, dynamic> json) =>
      _$MoralisGetWalletTransactionsItemMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoralisGetWalletTransactionsItemMetadataToJson(this);
}

@JsonSerializable()
class MoralisGetWalletTransactionsResponse {
  final int? total;
  final int? page;

  @JsonKey(name: 'page_size')
  final int? pageSize;

  final String? cursor;
  final List<MoralisGetWalletTransactionsItem>? result;

  MoralisGetWalletTransactionsResponse({
    this.total,
    this.page,
    this.pageSize,
    this.cursor,
    this.result,
  });

  factory MoralisGetWalletTransactionsResponse.fromJson(
      Map<String, dynamic> json) =>
      _$MoralisGetWalletTransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoralisGetWalletTransactionsResponseToJson(this);
}
