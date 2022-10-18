import 'package:ohowallet/core/exports.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  String name;
  @JsonKey(fromJson: _ethereumAddressFromJson, toJson: _ethereumAddressToJson)
  final EthereumAddress address;

  Contact({
    required this.name,
    required this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  static EthereumAddress _ethereumAddressFromJson(String address) =>
      EthereumAddress.fromHex(address);

  static String _ethereumAddressToJson(EthereumAddress address) =>
      address.hexEip55;
}

@JsonSerializable()
class ContactList {
  Map<String, Contact> contacts;

  ContactList({
    required this.contacts,
  });

  factory ContactList.fromJson(Map<String, dynamic> json) =>
      _$ContactListFromJson(json);

  Map<String, dynamic> toJson() => _$ContactListToJson(this);
}
