import 'package:ohowallet/core/exports.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(fromJson: _ethereumAddressFromJson, toJson: _ethereumAddressToJson)
  final EthereumAddress address;
  final String name;
  final String symbol;
  final int decimals;
  final String? iconUrl;

  Token({
    required this.address,
    required this.name,
    required this.symbol,
    required this.decimals,
    this.iconUrl,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  static EthereumAddress _ethereumAddressFromJson(String address) =>
      EthereumAddress.fromHex(address);

  static String _ethereumAddressToJson(EthereumAddress address) =>
      address.hexEip55;
}

@JsonSerializable()
class TokenList {
  Map<String, Map<String, Token>> tokens;

  TokenList({
    required this.tokens,
  });

  factory TokenList.fromJson(Map<String, dynamic> json) =>
      _$TokenListFromJson(json);

  Map<String, dynamic> toJson() => _$TokenListToJson(this);
}
