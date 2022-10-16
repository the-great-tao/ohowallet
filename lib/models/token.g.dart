// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      networkKey: json['networkKey'] as String,
      address: Token._ethereumAddressFromJson(json['address'] as String),
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      decimals: json['decimals'] as int,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'networkKey': instance.networkKey,
      'address': Token._ethereumAddressToJson(instance.address),
      'name': instance.name,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'iconUrl': instance.iconUrl,
    };

TokenList _$TokenListFromJson(Map<String, dynamic> json) => TokenList(
      tokens: (json['tokens'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, Token.fromJson(e as Map<String, dynamic>)),
            )),
      ),
    );

Map<String, dynamic> _$TokenListToJson(TokenList instance) => <String, dynamic>{
      'tokens': instance.tokens,
    };
