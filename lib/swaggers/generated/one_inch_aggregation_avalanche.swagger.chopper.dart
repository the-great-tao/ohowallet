// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_inch_aggregation_avalanche.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$OneInchAggregationAvalanche extends OneInchAggregationAvalanche {
  _$OneInchAggregationAvalanche([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = OneInchAggregationAvalanche;

  @override
  Future<Response<dynamic>> _FactoryHealthCheckController_healthcheck() {
    final String $url = '/v4.0/43114/healthcheck';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApproveSpenderResponseDto>>
      _ChainApproveController_getSpender() {
    final String $url = '/v4.0/43114/approve/spender';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ApproveSpenderResponseDto, ApproveSpenderResponseDto>($request);
  }

  @override
  Future<Response<ApproveCalldataResponseDto>>
      _ChainApproveController_getCallData({
    required String? tokenAddress,
    String? amount,
  }) {
    final String $url = '/v4.0/43114/approve/transaction';
    final Map<String, dynamic> $params = <String, dynamic>{
      'tokenAddress': tokenAddress,
      'amount': amount,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<ApproveCalldataResponseDto, ApproveCalldataResponseDto>($request);
  }

  @override
  Future<Response<dynamic>> _ChainApproveController_getAllowance({
    required String? tokenAddress,
    required String? walletAddress,
  }) {
    final String $url = '/v4.0/43114/approve/allowance';
    final Map<String, dynamic> $params = <String, dynamic>{
      'tokenAddress': tokenAddress,
      'walletAddress': walletAddress,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TokensResponseDto>> _ChainTokensController_getTokens() {
    final String $url = '/v4.0/43114/tokens';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TokensResponseDto, TokensResponseDto>($request);
  }

  @override
  Future<Response<dynamic>> _ChainPresetsController_getPresets() {
    final String $url = '/v4.0/43114/presets';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ProtocolsResponseDto>>
      _ChainProtocolsController_getProtocolsImages() {
    final String $url = '/v4.0/43114/liquidity-sources';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ProtocolsResponseDto, ProtocolsResponseDto>($request);
  }

  @override
  Future<Response<QuoteResponseDto>> _ExchangeController_getQuote({
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
    final String $url = '/v4.0/43114/quote';
    final Map<String, dynamic> $params = <String, dynamic>{
      'fromTokenAddress': fromTokenAddress,
      'toTokenAddress': toTokenAddress,
      'amount': amount,
      'protocols': protocols,
      'fee': fee,
      'gasLimit': gasLimit,
      'connectorTokens': connectorTokens,
      'complexityLevel': complexityLevel,
      'mainRouteParts': mainRouteParts,
      'parts': parts,
      'gasPrice': gasPrice,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<QuoteResponseDto, QuoteResponseDto>($request);
  }

  @override
  Future<Response<SwapResponseDto>> _ExchangeController_getSwap({
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
    final String $url = '/v4.0/43114/swap';
    final Map<String, dynamic> $params = <String, dynamic>{
      'fromTokenAddress': fromTokenAddress,
      'toTokenAddress': toTokenAddress,
      'amount': amount,
      'fromAddress': fromAddress,
      'slippage': slippage,
      'protocols': protocols,
      'destReceiver': destReceiver,
      'referrerAddress': referrerAddress,
      'fee': fee,
      'disableEstimate': disableEstimate,
      'permit': permit,
      'compatibilityMode': compatibilityMode,
      'burnChi': burnChi,
      'allowPartialFill': allowPartialFill,
      'parts': parts,
      'mainRouteParts': mainRouteParts,
      'connectorTokens': connectorTokens,
      'complexityLevel': complexityLevel,
      'gasLimit': gasLimit,
      'gasPrice': gasPrice,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SwapResponseDto, SwapResponseDto>($request);
  }
}
