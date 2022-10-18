// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      name: json['name'] as String,
      address: Contact._ethereumAddressFromJson(json['address'] as String),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'address': Contact._ethereumAddressToJson(instance.address),
    };

ContactList _$ContactListFromJson(Map<String, dynamic> json) => ContactList(
      contacts: (json['contacts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Contact.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ContactListToJson(ContactList instance) =>
    <String, dynamic>{
      'contacts': instance.contacts,
    };
