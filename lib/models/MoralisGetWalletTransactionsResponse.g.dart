// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoralisGetWalletTransactionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoralisGetWalletTransactionsItem _$MoralisGetWalletTransactionsItemFromJson(
        Map<String, dynamic> json) =>
    MoralisGetWalletTransactionsItem(
      transactionHash: json['transaction_hash'] as String?,
      address: json['address'] as String?,
      blockTimestamp: json['block_timestamp'] as String?,
      blockNumber: json['block_number'] as String?,
      blockHash: json['block_hash'] as String?,
      fromAddress: json['from_address'] as String?,
      toAddress: json['to_address'] as String?,
      value:
          json['value'] == null ? null : BigInt.parse(json['value'] as String),
    )
      ..formatedTime = json['formatedTime'] as String?
      ..metadata = json['metadata'] == null
          ? null
          : MoralisGetWalletTransactionsItemMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>)
      ..amountSentReceived = (json['amountSentReceived'] as num?)?.toDouble();

Map<String, dynamic> _$MoralisGetWalletTransactionsItemToJson(
        MoralisGetWalletTransactionsItem instance) =>
    <String, dynamic>{
      'transaction_hash': instance.transactionHash,
      'address': instance.address,
      'block_timestamp': instance.blockTimestamp,
      'block_number': instance.blockNumber,
      'block_hash': instance.blockHash,
      'from_address': instance.fromAddress,
      'to_address': instance.toAddress,
      'value': instance.value?.toString(),
      'formatedTime': instance.formatedTime,
      'metadata': instance.metadata,
      'amountSentReceived': instance.amountSentReceived,
    };

MoralisGetWalletTransactionsItemMetadata
    _$MoralisGetWalletTransactionsItemMetadataFromJson(
            Map<String, dynamic> json) =>
        MoralisGetWalletTransactionsItemMetadata(
          address: json['address'] as String?,
          name: json['name'] as String?,
          symbol: json['symbol'] as String?,
          decimals: json['decimals'] as String?,
          validated: json['validated'] as int?,
        );

Map<String, dynamic> _$MoralisGetWalletTransactionsItemMetadataToJson(
        MoralisGetWalletTransactionsItemMetadata instance) =>
    <String, dynamic>{
      'address': instance.address,
      'name': instance.name,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'validated': instance.validated,
    };

MoralisGetWalletTransactionsResponse
    _$MoralisGetWalletTransactionsResponseFromJson(Map<String, dynamic> json) =>
        MoralisGetWalletTransactionsResponse(
          total: json['total'] as int?,
          page: json['page'] as int?,
          pageSize: json['page_size'] as int?,
          cursor: json['cursor'] as String?,
          result: (json['result'] as List<dynamic>?)
              ?.map((e) => MoralisGetWalletTransactionsItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$MoralisGetWalletTransactionsResponseToJson(
        MoralisGetWalletTransactionsResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'cursor': instance.cursor,
      'result': instance.result,
    };
