import 'package:ohowallet/core/exports.dart';

part 'oho_transaction.g.dart';

@JsonSerializable()
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
  String? hash;

  @Index()
  int? blockNumber;

  @Index()
  DateTime? blockDate;

  String? value;
  String? tokenAmount;
  String? gasPrice;
  String? effectiveGasPrice;
  String? gasUsed;

  OHOTransaction({
    required this.status,
    required this.type,
    this.networkKey,
    this.tokenKey,
    this.tokenAddress,
    this.tokenAmount,
    this.from,
    this.to,
    this.hash,
    this.blockNumber,
    this.blockDate,
    this.value,
    this.gasPrice,
    this.effectiveGasPrice,
    this.gasUsed,
  });

  factory OHOTransaction.fromJson(Map<String, dynamic> json) =>
      _$OHOTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$OHOTransactionToJson(this);
}
