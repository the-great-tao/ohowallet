import 'package:ohowallet/core/exports.dart';

part 'oho_transaction.g.dart';

@Collection(accessor: 'ohoTransactions')
class OHOTransaction {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  OHOTransactionStatus status = OHOTransactionStatus.none;

  @Enumerated(EnumType.name)
  OHOTransactionType type = OHOTransactionType.none;

  @Index(type: IndexType.value, caseSensitive: false)
  String? networkKey;

  @Index(type: IndexType.value, caseSensitive: false)
  String? tokenKey;

  @Index(type: IndexType.value, caseSensitive: false)
  String? tokenAddress;

  @Index(type: IndexType.value, caseSensitive: false)
  String? from;

  @Index(type: IndexType.value, caseSensitive: false)
  String? to;

  @Index(unique: true)
  late String hash;

  @Index()
  int? blockNumber;

  @Index()
  DateTime? blockDate;

  String? gasPrice;
  String? value;
  String? amount;
  String? effectiveGasPrice;
  String? gasUsed;
}
