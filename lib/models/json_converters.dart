import 'package:ohowallet/core/exports.dart';

class EthereumAddressJsonConverter
    extends JsonConverter<EthereumAddress?, String?> {
  const EthereumAddressJsonConverter();

  @override
  EthereumAddress? fromJson(String? json) {
    if (json == null) return null;
    return EthereumAddress.fromHex(json);
  }

  @override
  String? toJson(EthereumAddress? object) {
    if (object == null) return null;
    return object.hexEip55;
  }
}
