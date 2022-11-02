// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_inch_aggregation_avalanche.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveSpenderResponseDto _$ApproveSpenderResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ApproveSpenderResponseDto(
      address: json['address'] as String,
    );

Map<String, dynamic> _$ApproveSpenderResponseDtoToJson(
        ApproveSpenderResponseDto instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

ApproveCalldataResponseDto _$ApproveCalldataResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ApproveCalldataResponseDto(
      data: json['data'] as String,
      gasPrice: json['gasPrice'] as String,
      to: json['to'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$ApproveCalldataResponseDtoToJson(
        ApproveCalldataResponseDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'gasPrice': instance.gasPrice,
      'to': instance.to,
      'value': instance.value,
    };

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) => TokenDto(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      decimals: (json['decimals'] as num).toDouble(),
      logoURI: json['logoURI'] as String,
    );

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'address': instance.address,
      'decimals': instance.decimals,
      'logoURI': instance.logoURI,
    };

TokensResponseDto _$TokensResponseDtoFromJson(Map<String, dynamic> json) =>
    TokensResponseDto(
      tokens: json['tokens'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TokensResponseDtoToJson(TokensResponseDto instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
    };

ProtocolImageDto _$ProtocolImageDtoFromJson(Map<String, dynamic> json) =>
    ProtocolImageDto(
      id: json['id'] as String,
      title: json['title'] as String,
      img: json['img'] as String,
      imgColor: json['img_color'] as String,
    );

Map<String, dynamic> _$ProtocolImageDtoToJson(ProtocolImageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'img_color': instance.imgColor,
    };

ProtocolsResponseDto _$ProtocolsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ProtocolsResponseDto(
      protocols: (json['protocols'] as List<dynamic>?)
              ?.map((e) => ProtocolImageDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProtocolsResponseDtoToJson(
        ProtocolsResponseDto instance) =>
    <String, dynamic>{
      'protocols': instance.protocols.map((e) => e.toJson()).toList(),
    };

PathViewDto _$PathViewDtoFromJson(Map<String, dynamic> json) => PathViewDto(
      name: json['name'] as String,
      $part: (json['part'] as num).toDouble(),
      fromTokenAddress: json['fromTokenAddress'] as String,
      toTokenAddress: json['toTokenAddress'] as String,
    );

Map<String, dynamic> _$PathViewDtoToJson(PathViewDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'part': instance.$part,
      'fromTokenAddress': instance.fromTokenAddress,
      'toTokenAddress': instance.toTokenAddress,
    };

QuoteResponseDto _$QuoteResponseDtoFromJson(Map<String, dynamic> json) =>
    QuoteResponseDto(
      fromToken: TokenDto.fromJson(json['fromToken'] as Map<String, dynamic>),
      toToken: TokenDto.fromJson(json['toToken'] as Map<String, dynamic>),
      toTokenAmount: json['toTokenAmount'] as String,
      fromTokenAmount: json['fromTokenAmount'] as String,
      protocols: (json['protocols'] as List<dynamic>?)
              ?.map((e) => PathViewDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      estimatedGas: (json['estimatedGas'] as num).toDouble(),
    );

Map<String, dynamic> _$QuoteResponseDtoToJson(QuoteResponseDto instance) =>
    <String, dynamic>{
      'fromToken': instance.fromToken.toJson(),
      'toToken': instance.toToken.toJson(),
      'toTokenAmount': instance.toTokenAmount,
      'fromTokenAmount': instance.fromTokenAmount,
      'protocols': instance.protocols.map((e) => e.toJson()).toList(),
      'estimatedGas': instance.estimatedGas,
    };

NestErrorMeta _$NestErrorMetaFromJson(Map<String, dynamic> json) =>
    NestErrorMeta(
      type: json['type'] as String,
      value: json['value'] as Object,
    );

Map<String, dynamic> _$NestErrorMetaToJson(NestErrorMeta instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

SwapErrorDto _$SwapErrorDtoFromJson(Map<String, dynamic> json) => SwapErrorDto(
      statusCode: (json['statusCode'] as num).toDouble(),
      error: json['error'] as String,
      description: json['description'] as String,
      requestId: json['requestId'] as String,
      meta: (json['meta'] as List<dynamic>?)
              ?.map((e) => NestErrorMeta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SwapErrorDtoToJson(SwapErrorDto instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'description': instance.description,
      'requestId': instance.requestId,
      'meta': instance.meta.map((e) => e.toJson()).toList(),
    };

Tx _$TxFromJson(Map<String, dynamic> json) => Tx(
      from: json['from'] as String,
      to: json['to'] as String,
      data: json['data'] as String,
      value: json['value'] as String,
      gasPrice: json['gasPrice'] as String,
      gas: json['gas'] as String,
    );

Map<String, dynamic> _$TxToJson(Tx instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'data': instance.data,
      'value': instance.value,
      'gasPrice': instance.gasPrice,
      'gas': instance.gas,
    };

SwapResponseDto _$SwapResponseDtoFromJson(Map<String, dynamic> json) =>
    SwapResponseDto(
      fromToken: TokenDto.fromJson(json['fromToken'] as Map<String, dynamic>),
      toToken: TokenDto.fromJson(json['toToken'] as Map<String, dynamic>),
      toTokenAmount: json['toTokenAmount'] as String,
      fromTokenAmount: json['fromTokenAmount'] as String,
      protocols: (json['protocols'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      tx: Tx.fromJson(json['tx'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SwapResponseDtoToJson(SwapResponseDto instance) =>
    <String, dynamic>{
      'fromToken': instance.fromToken.toJson(),
      'toToken': instance.toToken.toJson(),
      'toTokenAmount': instance.toTokenAmount,
      'fromTokenAmount': instance.fromTokenAmount,
      'protocols': instance.protocols,
      'tx': instance.tx.toJson(),
    };
