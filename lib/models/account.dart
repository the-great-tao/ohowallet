import 'package:ohowallet/core/exports.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String name;
  final String mnemonic;
  final String privateKey;
  @JsonKey(fromJson: _ethereumAddressFromJson, toJson: _ethereumAddressToJson)
  final EthereumAddress address;
  final bool removable;

  Account({
    required this.name,
    required this.mnemonic,
    required this.privateKey,
    required this.address,
    this.removable = true,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  static EthereumAddress _ethereumAddressFromJson(String address) =>
      EthereumAddress.fromHex(address);

  static String _ethereumAddressToJson(EthereumAddress address) =>
      address.hexEip55;
}

@JsonSerializable()
class AccountList {
  Map<String, Account> accounts;

  AccountList({
    required this.accounts,
  });

  factory AccountList.fromJson(Map<String, dynamic> json) =>
      _$AccountListFromJson(json);

  Map<String, dynamic> toJson() => _$AccountListToJson(this);
}
