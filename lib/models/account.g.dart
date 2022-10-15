// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      name: json['name'] as String,
      mnemonic: json['mnemonic'] as String,
      privateKey: json['privateKey'] as String,
      address: Account._ethereumAddressFromJson(json['address'] as String),
      removable: json['removable'] as bool? ?? true,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'name': instance.name,
      'mnemonic': instance.mnemonic,
      'privateKey': instance.privateKey,
      'address': Account._ethereumAddressToJson(instance.address),
      'removable': instance.removable,
    };

AccountList _$AccountListFromJson(Map<String, dynamic> json) => AccountList(
      accounts: (json['accounts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Account.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$AccountListToJson(AccountList instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
    };
