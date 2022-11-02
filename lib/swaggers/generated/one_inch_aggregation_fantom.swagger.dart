// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;

part 'one_inch_aggregation_fantom.swagger.chopper.dart';
part 'one_inch_aggregation_fantom.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class OneInchAggregationFantom extends ChopperService {
  static OneInchAggregationFantom create({
    ChopperClient? client,
    Authenticator? authenticator,
    String? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$OneInchAggregationFantom(client);
    }

    final newClient = ChopperClient(
        services: [_$OneInchAggregationFantom()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'http://');
    return _$OneInchAggregationFantom(newClient);
  }

  ///API health check
  Future<chopper.Response> v40250HealthcheckGet() {
    return _v40250HealthcheckGet();
  }

  ///API health check
  @Get(path: '/v4.0/250/healthcheck')
  Future<chopper.Response> _v40250HealthcheckGet();

  ///Address of the 1inch router that must be trusted to spend funds for the exchange
  Future<chopper.Response<ApproveSpenderResponseDto>>
      v40250ApproveSpenderGet() {
    generatedMapping.putIfAbsent(ApproveSpenderResponseDto,
        () => ApproveSpenderResponseDto.fromJsonFactory);

    return _v40250ApproveSpenderGet();
  }

  ///Address of the 1inch router that must be trusted to spend funds for the exchange
  @Get(path: '/v4.0/250/approve/spender')
  Future<chopper.Response<ApproveSpenderResponseDto>>
      _v40250ApproveSpenderGet();

  ///Generate data for calling the contract in order to allow the 1inch router to spend funds
  ///@param tokenAddress Token address you want to exchange
  ///@param amount The number of tokens that the 1inch router is allowed to spend.If not specified, it will be allowed to spend an infinite amount of tokens.
  Future<chopper.Response<ApproveCalldataResponseDto>>
      v40250ApproveTransactionGet({
    required String? tokenAddress,
    String? amount,
  }) {
    generatedMapping.putIfAbsent(ApproveCalldataResponseDto,
        () => ApproveCalldataResponseDto.fromJsonFactory);

    return _v40250ApproveTransactionGet(
        tokenAddress: tokenAddress, amount: amount);
  }

  ///Generate data for calling the contract in order to allow the 1inch router to spend funds
  ///@param tokenAddress Token address you want to exchange
  ///@param amount The number of tokens that the 1inch router is allowed to spend.If not specified, it will be allowed to spend an infinite amount of tokens.
  @Get(path: '/v4.0/250/approve/transaction')
  Future<chopper.Response<ApproveCalldataResponseDto>>
      _v40250ApproveTransactionGet({
    @Query('tokenAddress') required String? tokenAddress,
    @Query('amount') String? amount,
  });

  ///Get the number of tokens that the 1inch router is allowed to spend
  ///@param tokenAddress Token address you want to exchange
  ///@param walletAddress Wallet address for which you want to check
  Future<chopper.Response> v40250ApproveAllowanceGet({
    required String? tokenAddress,
    required String? walletAddress,
  }) {
    return _v40250ApproveAllowanceGet(
        tokenAddress: tokenAddress, walletAddress: walletAddress);
  }

  ///Get the number of tokens that the 1inch router is allowed to spend
  ///@param tokenAddress Token address you want to exchange
  ///@param walletAddress Wallet address for which you want to check
  @Get(path: '/v4.0/250/approve/allowance')
  Future<chopper.Response> _v40250ApproveAllowanceGet({
    @Query('tokenAddress') required String? tokenAddress,
    @Query('walletAddress') required String? walletAddress,
  });

  ///List of tokens that are available for swap in the 1inch Aggregation protocol
  Future<chopper.Response<TokensResponseDto>> v40250TokensGet() {
    generatedMapping.putIfAbsent(
        TokensResponseDto, () => TokensResponseDto.fromJsonFactory);

    return _v40250TokensGet();
  }

  ///List of tokens that are available for swap in the 1inch Aggregation protocol
  @Get(path: '/v4.0/250/tokens')
  Future<chopper.Response<TokensResponseDto>> _v40250TokensGet();

  ///List of preset configurations for the 1inch router
  Future<chopper.Response> v40250PresetsGet() {
    return _v40250PresetsGet();
  }

  ///List of preset configurations for the 1inch router
  @Get(path: '/v4.0/250/presets')
  Future<chopper.Response> _v40250PresetsGet();

  ///List of liquidity sources that are available for routing in the 1inch Aggregation protocol
  Future<chopper.Response<ProtocolsResponseDto>> v40250LiquiditySourcesGet() {
    generatedMapping.putIfAbsent(
        ProtocolsResponseDto, () => ProtocolsResponseDto.fromJsonFactory);

    return _v40250LiquiditySourcesGet();
  }

  ///List of liquidity sources that are available for routing in the 1inch Aggregation protocol
  @Get(path: '/v4.0/250/liquidity-sources')
  Future<chopper.Response<ProtocolsResponseDto>> _v40250LiquiditySourcesGet();

  ///Find the best quote to exchange via 1inch router
  ///@param fromTokenAddress
  ///@param toTokenAddress
  ///@param amount
  ///@param protocols default: all
  ///@param fee Min: 0; max: 3; Max: 0; max: 3; default: 0;  !should be the same for quote and swap!
  ///@param gasLimit
  ///@param connectorTokens max: 5; !should be the same for quote and swap!
  ///@param complexityLevel min: 0; max: 3; default: 2; !should be the same for quote and swap!
  ///@param mainRouteParts default: 10; max: 50  !should be the same for quote and swap!
  ///@param parts split parts. default: 50;  max: 100!should be the same for quote and swap!
  ///@param gasPrice default: fast from network
  Future<chopper.Response<QuoteResponseDto>> v40250QuoteGet({
    required String? fromTokenAddress,
    required String? toTokenAddress,
    required String? amount,
    String? protocols,
    String? fee,
    Object? gasLimit,
    Object? connectorTokens,
    Object? complexityLevel,
    Object? mainRouteParts,
    Object? parts,
    Object? gasPrice,
  }) {
    generatedMapping.putIfAbsent(
        QuoteResponseDto, () => QuoteResponseDto.fromJsonFactory);

    return _v40250QuoteGet(
        fromTokenAddress: fromTokenAddress,
        toTokenAddress: toTokenAddress,
        amount: amount,
        protocols: protocols,
        fee: fee,
        gasLimit: gasLimit,
        connectorTokens: connectorTokens,
        complexityLevel: complexityLevel,
        mainRouteParts: mainRouteParts,
        parts: parts,
        gasPrice: gasPrice);
  }

  ///Find the best quote to exchange via 1inch router
  ///@param fromTokenAddress
  ///@param toTokenAddress
  ///@param amount
  ///@param protocols default: all
  ///@param fee Min: 0; max: 3; Max: 0; max: 3; default: 0;  !should be the same for quote and swap!
  ///@param gasLimit
  ///@param connectorTokens max: 5; !should be the same for quote and swap!
  ///@param complexityLevel min: 0; max: 3; default: 2; !should be the same for quote and swap!
  ///@param mainRouteParts default: 10; max: 50  !should be the same for quote and swap!
  ///@param parts split parts. default: 50;  max: 100!should be the same for quote and swap!
  ///@param gasPrice default: fast from network
  @Get(path: '/v4.0/250/quote')
  Future<chopper.Response<QuoteResponseDto>> _v40250QuoteGet({
    @Query('fromTokenAddress') required String? fromTokenAddress,
    @Query('toTokenAddress') required String? toTokenAddress,
    @Query('amount') required String? amount,
    @Query('protocols') String? protocols,
    @Query('fee') String? fee,
    @Query('gasLimit') Object? gasLimit,
    @Query('connectorTokens') Object? connectorTokens,
    @Query('complexityLevel') Object? complexityLevel,
    @Query('mainRouteParts') Object? mainRouteParts,
    @Query('parts') Object? parts,
    @Query('gasPrice') Object? gasPrice,
  });

  ///Generate data for calling the 1inch router for exchange
  ///@param fromTokenAddress
  ///@param toTokenAddress
  ///@param amount
  ///@param fromAddress The address that calls the 1inch contract
  ///@param slippage min: 0; max: 50;
  ///@param protocols default: all
  ///@param destReceiver Receiver of destination currency. default: fromAddress
  ///@param referrerAddress
  ///@param fee Min: 0; max: 3; Max: 0; max: 3; default: 0;  !should be the same for quote and swap!
  ///@param disableEstimate
  ///@param permit https://eips.ethereum.org/EIPS/eip-2612
  ///@param compatibilityMode Allows to build calldata without optimized routers
  ///@param burnChi default: false; Suggest to check user's balance and allowance before set this flag; CHI should be approved to spender address
  ///@param allowPartialFill
  ///@param parts split parts. default: 50;  max: 100!should be the same for quote and swap!
  ///@param mainRouteParts default: 10; max: 50  !should be the same for quote and swap!
  ///@param connectorTokens max: 5; !should be the same for quote and swap!
  ///@param complexityLevel min: 0; max: 3; default: 2; !should be the same for quote and swap!
  ///@param gasLimit
  ///@param gasPrice default: fast from network
  Future<chopper.Response<SwapResponseDto>> v40250SwapGet({
    required String? fromTokenAddress,
    required String? toTokenAddress,
    required String? amount,
    required String? fromAddress,
    required num? slippage,
    String? protocols,
    String? destReceiver,
    String? referrerAddress,
    String? fee,
    bool? disableEstimate,
    String? permit,
    bool? compatibilityMode,
    bool? burnChi,
    bool? allowPartialFill,
    Object? parts,
    Object? mainRouteParts,
    Object? connectorTokens,
    Object? complexityLevel,
    Object? gasLimit,
    Object? gasPrice,
  }) {
    generatedMapping.putIfAbsent(
        SwapResponseDto, () => SwapResponseDto.fromJsonFactory);

    return _v40250SwapGet(
        fromTokenAddress: fromTokenAddress,
        toTokenAddress: toTokenAddress,
        amount: amount,
        fromAddress: fromAddress,
        slippage: slippage,
        protocols: protocols,
        destReceiver: destReceiver,
        referrerAddress: referrerAddress,
        fee: fee,
        disableEstimate: disableEstimate,
        permit: permit,
        compatibilityMode: compatibilityMode,
        burnChi: burnChi,
        allowPartialFill: allowPartialFill,
        parts: parts,
        mainRouteParts: mainRouteParts,
        connectorTokens: connectorTokens,
        complexityLevel: complexityLevel,
        gasLimit: gasLimit,
        gasPrice: gasPrice);
  }

  ///Generate data for calling the 1inch router for exchange
  ///@param fromTokenAddress
  ///@param toTokenAddress
  ///@param amount
  ///@param fromAddress The address that calls the 1inch contract
  ///@param slippage min: 0; max: 50;
  ///@param protocols default: all
  ///@param destReceiver Receiver of destination currency. default: fromAddress
  ///@param referrerAddress
  ///@param fee Min: 0; max: 3; Max: 0; max: 3; default: 0;  !should be the same for quote and swap!
  ///@param disableEstimate
  ///@param permit https://eips.ethereum.org/EIPS/eip-2612
  ///@param compatibilityMode Allows to build calldata without optimized routers
  ///@param burnChi default: false; Suggest to check user's balance and allowance before set this flag; CHI should be approved to spender address
  ///@param allowPartialFill
  ///@param parts split parts. default: 50;  max: 100!should be the same for quote and swap!
  ///@param mainRouteParts default: 10; max: 50  !should be the same for quote and swap!
  ///@param connectorTokens max: 5; !should be the same for quote and swap!
  ///@param complexityLevel min: 0; max: 3; default: 2; !should be the same for quote and swap!
  ///@param gasLimit
  ///@param gasPrice default: fast from network
  @Get(path: '/v4.0/250/swap')
  Future<chopper.Response<SwapResponseDto>> _v40250SwapGet({
    @Query('fromTokenAddress') required String? fromTokenAddress,
    @Query('toTokenAddress') required String? toTokenAddress,
    @Query('amount') required String? amount,
    @Query('fromAddress') required String? fromAddress,
    @Query('slippage') required num? slippage,
    @Query('protocols') String? protocols,
    @Query('destReceiver') String? destReceiver,
    @Query('referrerAddress') String? referrerAddress,
    @Query('fee') String? fee,
    @Query('disableEstimate') bool? disableEstimate,
    @Query('permit') String? permit,
    @Query('compatibilityMode') bool? compatibilityMode,
    @Query('burnChi') bool? burnChi,
    @Query('allowPartialFill') bool? allowPartialFill,
    @Query('parts') Object? parts,
    @Query('mainRouteParts') Object? mainRouteParts,
    @Query('connectorTokens') Object? connectorTokens,
    @Query('complexityLevel') Object? complexityLevel,
    @Query('gasLimit') Object? gasLimit,
    @Query('gasPrice') Object? gasPrice,
  });
}

@JsonSerializable(explicitToJson: true)
class ApproveSpenderResponseDto {
  ApproveSpenderResponseDto({
    required this.address,
  });

  factory ApproveSpenderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ApproveSpenderResponseDtoFromJson(json);

  @JsonKey(name: 'address')
  final String address;
  static const fromJsonFactory = _$ApproveSpenderResponseDtoFromJson;
  static const toJsonFactory = _$ApproveSpenderResponseDtoToJson;
  Map<String, dynamic> toJson() => _$ApproveSpenderResponseDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApproveSpenderResponseDto &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(address) ^ runtimeType.hashCode;
}

extension $ApproveSpenderResponseDtoExtension on ApproveSpenderResponseDto {
  ApproveSpenderResponseDto copyWith({String? address}) {
    return ApproveSpenderResponseDto(address: address ?? this.address);
  }

  ApproveSpenderResponseDto copyWithWrapped({Wrapped<String>? address}) {
    return ApproveSpenderResponseDto(
        address: (address != null ? address.value : this.address));
  }
}

@JsonSerializable(explicitToJson: true)
class ApproveCalldataResponseDto {
  ApproveCalldataResponseDto({
    required this.data,
    required this.gasPrice,
    required this.to,
    required this.value,
  });

  factory ApproveCalldataResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ApproveCalldataResponseDtoFromJson(json);

  @JsonKey(name: 'data')
  final String data;
  @JsonKey(name: 'gasPrice')
  final String gasPrice;
  @JsonKey(name: 'to')
  final String to;
  @JsonKey(name: 'value')
  final String value;
  static const fromJsonFactory = _$ApproveCalldataResponseDtoFromJson;
  static const toJsonFactory = _$ApproveCalldataResponseDtoToJson;
  Map<String, dynamic> toJson() => _$ApproveCalldataResponseDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApproveCalldataResponseDto &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.gasPrice, gasPrice) ||
                const DeepCollectionEquality()
                    .equals(other.gasPrice, gasPrice)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(gasPrice) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $ApproveCalldataResponseDtoExtension on ApproveCalldataResponseDto {
  ApproveCalldataResponseDto copyWith(
      {String? data, String? gasPrice, String? to, String? value}) {
    return ApproveCalldataResponseDto(
        data: data ?? this.data,
        gasPrice: gasPrice ?? this.gasPrice,
        to: to ?? this.to,
        value: value ?? this.value);
  }

  ApproveCalldataResponseDto copyWithWrapped(
      {Wrapped<String>? data,
      Wrapped<String>? gasPrice,
      Wrapped<String>? to,
      Wrapped<String>? value}) {
    return ApproveCalldataResponseDto(
        data: (data != null ? data.value : this.data),
        gasPrice: (gasPrice != null ? gasPrice.value : this.gasPrice),
        to: (to != null ? to.value : this.to),
        value: (value != null ? value.value : this.value));
  }
}

@JsonSerializable(explicitToJson: true)
class TokenDto {
  TokenDto({
    required this.symbol,
    required this.name,
    required this.address,
    required this.decimals,
    required this.logoURI,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'decimals')
  final double decimals;
  @JsonKey(name: 'logoURI')
  final String logoURI;
  static const fromJsonFactory = _$TokenDtoFromJson;
  static const toJsonFactory = _$TokenDtoToJson;
  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TokenDto &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.decimals, decimals) ||
                const DeepCollectionEquality()
                    .equals(other.decimals, decimals)) &&
            (identical(other.logoURI, logoURI) ||
                const DeepCollectionEquality().equals(other.logoURI, logoURI)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(symbol) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(decimals) ^
      const DeepCollectionEquality().hash(logoURI) ^
      runtimeType.hashCode;
}

extension $TokenDtoExtension on TokenDto {
  TokenDto copyWith(
      {String? symbol,
      String? name,
      String? address,
      double? decimals,
      String? logoURI}) {
    return TokenDto(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        address: address ?? this.address,
        decimals: decimals ?? this.decimals,
        logoURI: logoURI ?? this.logoURI);
  }

  TokenDto copyWithWrapped(
      {Wrapped<String>? symbol,
      Wrapped<String>? name,
      Wrapped<String>? address,
      Wrapped<double>? decimals,
      Wrapped<String>? logoURI}) {
    return TokenDto(
        symbol: (symbol != null ? symbol.value : this.symbol),
        name: (name != null ? name.value : this.name),
        address: (address != null ? address.value : this.address),
        decimals: (decimals != null ? decimals.value : this.decimals),
        logoURI: (logoURI != null ? logoURI.value : this.logoURI));
  }
}

@JsonSerializable(explicitToJson: true)
class TokensResponseDto {
  TokensResponseDto({
    required this.tokens,
  });

  factory TokensResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseDtoFromJson(json);

  @JsonKey(name: 'tokens')
  final Map<String, dynamic> tokens;
  static const fromJsonFactory = _$TokensResponseDtoFromJson;
  static const toJsonFactory = _$TokensResponseDtoToJson;
  Map<String, dynamic> toJson() => _$TokensResponseDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TokensResponseDto &&
            (identical(other.tokens, tokens) ||
                const DeepCollectionEquality().equals(other.tokens, tokens)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(tokens) ^ runtimeType.hashCode;
}

extension $TokensResponseDtoExtension on TokensResponseDto {
  TokensResponseDto copyWith({Map<String, dynamic>? tokens}) {
    return TokensResponseDto(tokens: tokens ?? this.tokens);
  }

  TokensResponseDto copyWithWrapped({Wrapped<Map<String, dynamic>>? tokens}) {
    return TokensResponseDto(
        tokens: (tokens != null ? tokens.value : this.tokens));
  }
}

@JsonSerializable(explicitToJson: true)
class ProtocolImageDto {
  ProtocolImageDto({
    required this.id,
    required this.title,
    required this.img,
    required this.imgColor,
  });

  factory ProtocolImageDto.fromJson(Map<String, dynamic> json) =>
      _$ProtocolImageDtoFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'img')
  final String img;
  @JsonKey(name: 'img_color')
  final String imgColor;
  static const fromJsonFactory = _$ProtocolImageDtoFromJson;
  static const toJsonFactory = _$ProtocolImageDtoToJson;
  Map<String, dynamic> toJson() => _$ProtocolImageDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProtocolImageDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.img, img) ||
                const DeepCollectionEquality().equals(other.img, img)) &&
            (identical(other.imgColor, imgColor) ||
                const DeepCollectionEquality()
                    .equals(other.imgColor, imgColor)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(img) ^
      const DeepCollectionEquality().hash(imgColor) ^
      runtimeType.hashCode;
}

extension $ProtocolImageDtoExtension on ProtocolImageDto {
  ProtocolImageDto copyWith(
      {String? id, String? title, String? img, String? imgColor}) {
    return ProtocolImageDto(
        id: id ?? this.id,
        title: title ?? this.title,
        img: img ?? this.img,
        imgColor: imgColor ?? this.imgColor);
  }

  ProtocolImageDto copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<String>? title,
      Wrapped<String>? img,
      Wrapped<String>? imgColor}) {
    return ProtocolImageDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        img: (img != null ? img.value : this.img),
        imgColor: (imgColor != null ? imgColor.value : this.imgColor));
  }
}

@JsonSerializable(explicitToJson: true)
class ProtocolsResponseDto {
  ProtocolsResponseDto({
    required this.protocols,
  });

  factory ProtocolsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProtocolsResponseDtoFromJson(json);

  @JsonKey(name: 'protocols', defaultValue: <ProtocolImageDto>[])
  final List<ProtocolImageDto> protocols;
  static const fromJsonFactory = _$ProtocolsResponseDtoFromJson;
  static const toJsonFactory = _$ProtocolsResponseDtoToJson;
  Map<String, dynamic> toJson() => _$ProtocolsResponseDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProtocolsResponseDto &&
            (identical(other.protocols, protocols) ||
                const DeepCollectionEquality()
                    .equals(other.protocols, protocols)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(protocols) ^ runtimeType.hashCode;
}

extension $ProtocolsResponseDtoExtension on ProtocolsResponseDto {
  ProtocolsResponseDto copyWith({List<ProtocolImageDto>? protocols}) {
    return ProtocolsResponseDto(protocols: protocols ?? this.protocols);
  }

  ProtocolsResponseDto copyWithWrapped(
      {Wrapped<List<ProtocolImageDto>>? protocols}) {
    return ProtocolsResponseDto(
        protocols: (protocols != null ? protocols.value : this.protocols));
  }
}

@JsonSerializable(explicitToJson: true)
class PathViewDto {
  PathViewDto({
    required this.name,
    required this.$part,
    required this.fromTokenAddress,
    required this.toTokenAddress,
  });

  factory PathViewDto.fromJson(Map<String, dynamic> json) =>
      _$PathViewDtoFromJson(json);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'part')
  final double $part;
  @JsonKey(name: 'fromTokenAddress')
  final String fromTokenAddress;
  @JsonKey(name: 'toTokenAddress')
  final String toTokenAddress;
  static const fromJsonFactory = _$PathViewDtoFromJson;
  static const toJsonFactory = _$PathViewDtoToJson;
  Map<String, dynamic> toJson() => _$PathViewDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PathViewDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.$part, $part) ||
                const DeepCollectionEquality().equals(other.$part, $part)) &&
            (identical(other.fromTokenAddress, fromTokenAddress) ||
                const DeepCollectionEquality()
                    .equals(other.fromTokenAddress, fromTokenAddress)) &&
            (identical(other.toTokenAddress, toTokenAddress) ||
                const DeepCollectionEquality()
                    .equals(other.toTokenAddress, toTokenAddress)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash($part) ^
      const DeepCollectionEquality().hash(fromTokenAddress) ^
      const DeepCollectionEquality().hash(toTokenAddress) ^
      runtimeType.hashCode;
}

extension $PathViewDtoExtension on PathViewDto {
  PathViewDto copyWith(
      {String? name,
      double? $part,
      String? fromTokenAddress,
      String? toTokenAddress}) {
    return PathViewDto(
        name: name ?? this.name,
        $part: $part ?? this.$part,
        fromTokenAddress: fromTokenAddress ?? this.fromTokenAddress,
        toTokenAddress: toTokenAddress ?? this.toTokenAddress);
  }

  PathViewDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<double>? $part,
      Wrapped<String>? fromTokenAddress,
      Wrapped<String>? toTokenAddress}) {
    return PathViewDto(
        name: (name != null ? name.value : this.name),
        $part: ($part != null ? $part.value : this.$part),
        fromTokenAddress: (fromTokenAddress != null
            ? fromTokenAddress.value
            : this.fromTokenAddress),
        toTokenAddress: (toTokenAddress != null
            ? toTokenAddress.value
            : this.toTokenAddress));
  }
}

@JsonSerializable(explicitToJson: true)
class QuoteResponseDto {
  QuoteResponseDto({
    required this.fromToken,
    required this.toToken,
    required this.toTokenAmount,
    required this.fromTokenAmount,
    required this.protocols,
    required this.estimatedGas,
  });

  factory QuoteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseDtoFromJson(json);

  @JsonKey(name: 'fromToken')
  final TokenDto fromToken;
  @JsonKey(name: 'toToken')
  final TokenDto toToken;
  @JsonKey(name: 'toTokenAmount')
  final String toTokenAmount;
  @JsonKey(name: 'fromTokenAmount')
  final String fromTokenAmount;
  @JsonKey(name: 'protocols', defaultValue: <PathViewDto>[])
  final List<PathViewDto> protocols;
  @JsonKey(name: 'estimatedGas')
  final double estimatedGas;
  static const fromJsonFactory = _$QuoteResponseDtoFromJson;
  static const toJsonFactory = _$QuoteResponseDtoToJson;
  Map<String, dynamic> toJson() => _$QuoteResponseDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QuoteResponseDto &&
            (identical(other.fromToken, fromToken) ||
                const DeepCollectionEquality()
                    .equals(other.fromToken, fromToken)) &&
            (identical(other.toToken, toToken) ||
                const DeepCollectionEquality()
                    .equals(other.toToken, toToken)) &&
            (identical(other.toTokenAmount, toTokenAmount) ||
                const DeepCollectionEquality()
                    .equals(other.toTokenAmount, toTokenAmount)) &&
            (identical(other.fromTokenAmount, fromTokenAmount) ||
                const DeepCollectionEquality()
                    .equals(other.fromTokenAmount, fromTokenAmount)) &&
            (identical(other.protocols, protocols) ||
                const DeepCollectionEquality()
                    .equals(other.protocols, protocols)) &&
            (identical(other.estimatedGas, estimatedGas) ||
                const DeepCollectionEquality()
                    .equals(other.estimatedGas, estimatedGas)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fromToken) ^
      const DeepCollectionEquality().hash(toToken) ^
      const DeepCollectionEquality().hash(toTokenAmount) ^
      const DeepCollectionEquality().hash(fromTokenAmount) ^
      const DeepCollectionEquality().hash(protocols) ^
      const DeepCollectionEquality().hash(estimatedGas) ^
      runtimeType.hashCode;
}

extension $QuoteResponseDtoExtension on QuoteResponseDto {
  QuoteResponseDto copyWith(
      {TokenDto? fromToken,
      TokenDto? toToken,
      String? toTokenAmount,
      String? fromTokenAmount,
      List<PathViewDto>? protocols,
      double? estimatedGas}) {
    return QuoteResponseDto(
        fromToken: fromToken ?? this.fromToken,
        toToken: toToken ?? this.toToken,
        toTokenAmount: toTokenAmount ?? this.toTokenAmount,
        fromTokenAmount: fromTokenAmount ?? this.fromTokenAmount,
        protocols: protocols ?? this.protocols,
        estimatedGas: estimatedGas ?? this.estimatedGas);
  }

  QuoteResponseDto copyWithWrapped(
      {Wrapped<TokenDto>? fromToken,
      Wrapped<TokenDto>? toToken,
      Wrapped<String>? toTokenAmount,
      Wrapped<String>? fromTokenAmount,
      Wrapped<List<PathViewDto>>? protocols,
      Wrapped<double>? estimatedGas}) {
    return QuoteResponseDto(
        fromToken: (fromToken != null ? fromToken.value : this.fromToken),
        toToken: (toToken != null ? toToken.value : this.toToken),
        toTokenAmount:
            (toTokenAmount != null ? toTokenAmount.value : this.toTokenAmount),
        fromTokenAmount: (fromTokenAmount != null
            ? fromTokenAmount.value
            : this.fromTokenAmount),
        protocols: (protocols != null ? protocols.value : this.protocols),
        estimatedGas:
            (estimatedGas != null ? estimatedGas.value : this.estimatedGas));
  }
}

@JsonSerializable(explicitToJson: true)
class NestErrorMeta {
  NestErrorMeta({
    required this.type,
    required this.value,
  });

  factory NestErrorMeta.fromJson(Map<String, dynamic> json) =>
      _$NestErrorMetaFromJson(json);

  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'value')
  final Object value;
  static const fromJsonFactory = _$NestErrorMetaFromJson;
  static const toJsonFactory = _$NestErrorMetaToJson;
  Map<String, dynamic> toJson() => _$NestErrorMetaToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NestErrorMeta &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $NestErrorMetaExtension on NestErrorMeta {
  NestErrorMeta copyWith({String? type, Object? value}) {
    return NestErrorMeta(type: type ?? this.type, value: value ?? this.value);
  }

  NestErrorMeta copyWithWrapped(
      {Wrapped<String>? type, Wrapped<Object>? value}) {
    return NestErrorMeta(
        type: (type != null ? type.value : this.type),
        value: (value != null ? value.value : this.value));
  }
}

@JsonSerializable(explicitToJson: true)
class SwapErrorDto {
  SwapErrorDto({
    required this.statusCode,
    required this.error,
    required this.description,
    required this.requestId,
    required this.meta,
  });

  factory SwapErrorDto.fromJson(Map<String, dynamic> json) =>
      _$SwapErrorDtoFromJson(json);

  @JsonKey(name: 'statusCode')
  final double statusCode;
  @JsonKey(name: 'error')
  final String error;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'requestId')
  final String requestId;
  @JsonKey(name: 'meta', defaultValue: <NestErrorMeta>[])
  final List<NestErrorMeta> meta;
  static const fromJsonFactory = _$SwapErrorDtoFromJson;
  static const toJsonFactory = _$SwapErrorDtoToJson;
  Map<String, dynamic> toJson() => _$SwapErrorDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SwapErrorDto &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.requestId, requestId) ||
                const DeepCollectionEquality()
                    .equals(other.requestId, requestId)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(requestId) ^
      const DeepCollectionEquality().hash(meta) ^
      runtimeType.hashCode;
}

extension $SwapErrorDtoExtension on SwapErrorDto {
  SwapErrorDto copyWith(
      {double? statusCode,
      String? error,
      String? description,
      String? requestId,
      List<NestErrorMeta>? meta}) {
    return SwapErrorDto(
        statusCode: statusCode ?? this.statusCode,
        error: error ?? this.error,
        description: description ?? this.description,
        requestId: requestId ?? this.requestId,
        meta: meta ?? this.meta);
  }

  SwapErrorDto copyWithWrapped(
      {Wrapped<double>? statusCode,
      Wrapped<String>? error,
      Wrapped<String>? description,
      Wrapped<String>? requestId,
      Wrapped<List<NestErrorMeta>>? meta}) {
    return SwapErrorDto(
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        error: (error != null ? error.value : this.error),
        description:
            (description != null ? description.value : this.description),
        requestId: (requestId != null ? requestId.value : this.requestId),
        meta: (meta != null ? meta.value : this.meta));
  }
}

@JsonSerializable(explicitToJson: true)
class Tx {
  Tx({
    required this.from,
    required this.to,
    required this.data,
    required this.value,
    required this.gasPrice,
    required this.gas,
  });

  factory Tx.fromJson(Map<String, dynamic> json) => _$TxFromJson(json);

  @JsonKey(name: 'from')
  final String from;
  @JsonKey(name: 'to')
  final String to;
  @JsonKey(name: 'data')
  final String data;
  @JsonKey(name: 'value')
  final String value;
  @JsonKey(name: 'gasPrice')
  final String gasPrice;
  @JsonKey(name: 'gas')
  final String gas;
  static const fromJsonFactory = _$TxFromJson;
  static const toJsonFactory = _$TxToJson;
  Map<String, dynamic> toJson() => _$TxToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Tx &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.gasPrice, gasPrice) ||
                const DeepCollectionEquality()
                    .equals(other.gasPrice, gasPrice)) &&
            (identical(other.gas, gas) ||
                const DeepCollectionEquality().equals(other.gas, gas)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(gasPrice) ^
      const DeepCollectionEquality().hash(gas) ^
      runtimeType.hashCode;
}

extension $TxExtension on Tx {
  Tx copyWith(
      {String? from,
      String? to,
      String? data,
      String? value,
      String? gasPrice,
      String? gas}) {
    return Tx(
        from: from ?? this.from,
        to: to ?? this.to,
        data: data ?? this.data,
        value: value ?? this.value,
        gasPrice: gasPrice ?? this.gasPrice,
        gas: gas ?? this.gas);
  }

  Tx copyWithWrapped(
      {Wrapped<String>? from,
      Wrapped<String>? to,
      Wrapped<String>? data,
      Wrapped<String>? value,
      Wrapped<String>? gasPrice,
      Wrapped<String>? gas}) {
    return Tx(
        from: (from != null ? from.value : this.from),
        to: (to != null ? to.value : this.to),
        data: (data != null ? data.value : this.data),
        value: (value != null ? value.value : this.value),
        gasPrice: (gasPrice != null ? gasPrice.value : this.gasPrice),
        gas: (gas != null ? gas.value : this.gas));
  }
}

@JsonSerializable(explicitToJson: true)
class SwapResponseDto {
  SwapResponseDto({
    required this.fromToken,
    required this.toToken,
    required this.toTokenAmount,
    required this.fromTokenAmount,
    required this.protocols,
    required this.tx,
  });

  factory SwapResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SwapResponseDtoFromJson(json);

  @JsonKey(name: 'fromToken')
  final TokenDto fromToken;
  @JsonKey(name: 'toToken')
  final TokenDto toToken;
  @JsonKey(name: 'toTokenAmount')
  final String toTokenAmount;
  @JsonKey(name: 'fromTokenAmount')
  final String fromTokenAmount;
  @JsonKey(name: 'protocols', defaultValue: <String>[])
  final List<String> protocols;
  @JsonKey(name: 'tx')
  final Tx tx;
  static const fromJsonFactory = _$SwapResponseDtoFromJson;
  static const toJsonFactory = _$SwapResponseDtoToJson;
  Map<String, dynamic> toJson() => _$SwapResponseDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SwapResponseDto &&
            (identical(other.fromToken, fromToken) ||
                const DeepCollectionEquality()
                    .equals(other.fromToken, fromToken)) &&
            (identical(other.toToken, toToken) ||
                const DeepCollectionEquality()
                    .equals(other.toToken, toToken)) &&
            (identical(other.toTokenAmount, toTokenAmount) ||
                const DeepCollectionEquality()
                    .equals(other.toTokenAmount, toTokenAmount)) &&
            (identical(other.fromTokenAmount, fromTokenAmount) ||
                const DeepCollectionEquality()
                    .equals(other.fromTokenAmount, fromTokenAmount)) &&
            (identical(other.protocols, protocols) ||
                const DeepCollectionEquality()
                    .equals(other.protocols, protocols)) &&
            (identical(other.tx, tx) ||
                const DeepCollectionEquality().equals(other.tx, tx)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fromToken) ^
      const DeepCollectionEquality().hash(toToken) ^
      const DeepCollectionEquality().hash(toTokenAmount) ^
      const DeepCollectionEquality().hash(fromTokenAmount) ^
      const DeepCollectionEquality().hash(protocols) ^
      const DeepCollectionEquality().hash(tx) ^
      runtimeType.hashCode;
}

extension $SwapResponseDtoExtension on SwapResponseDto {
  SwapResponseDto copyWith(
      {TokenDto? fromToken,
      TokenDto? toToken,
      String? toTokenAmount,
      String? fromTokenAmount,
      List<String>? protocols,
      Tx? tx}) {
    return SwapResponseDto(
        fromToken: fromToken ?? this.fromToken,
        toToken: toToken ?? this.toToken,
        toTokenAmount: toTokenAmount ?? this.toTokenAmount,
        fromTokenAmount: fromTokenAmount ?? this.fromTokenAmount,
        protocols: protocols ?? this.protocols,
        tx: tx ?? this.tx);
  }

  SwapResponseDto copyWithWrapped(
      {Wrapped<TokenDto>? fromToken,
      Wrapped<TokenDto>? toToken,
      Wrapped<String>? toTokenAmount,
      Wrapped<String>? fromTokenAmount,
      Wrapped<List<String>>? protocols,
      Wrapped<Tx>? tx}) {
    return SwapResponseDto(
        fromToken: (fromToken != null ? fromToken.value : this.fromToken),
        toToken: (toToken != null ? toToken.value : this.toToken),
        toTokenAmount:
            (toTokenAmount != null ? toTokenAmount.value : this.toTokenAmount),
        fromTokenAmount: (fromTokenAmount != null
            ? fromTokenAmount.value
            : this.fromTokenAmount),
        protocols: (protocols != null ? protocols.value : this.protocols),
        tx: (tx != null ? tx.value : this.tx));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
