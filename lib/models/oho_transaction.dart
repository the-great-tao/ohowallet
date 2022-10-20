import 'package:ohowallet/core/exports.dart';

part 'oho_transaction.g.dart';

@JsonSerializable()
@Collection(accessor: 'ohoTransactions')
class OHOTransaction {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  @Enumerated(EnumType.name)
  OHOTransactionStatus status = OHOTransactionStatus.none;

  @Index(type: IndexType.value)
  @Enumerated(EnumType.name)
  OHOTransactionType type = OHOTransactionType.none;

  @Index()
  DateTime? submitDate;

  @Index(type: IndexType.value, caseSensitive: false)
  String? networkKey;
  String? networkCurrencySymbol;

  @Index(type: IndexType.value, caseSensitive: false)
  String? tokenKey;
  @Index(type: IndexType.value, caseSensitive: false)
  String? tokenAddress;
  String? tokenSymbol;
  String? tokenAmount;
  int? tokenDecimals;

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

  int? nonce;
  String? input;
  String? value;
  String? gasPrice;
  String? effectiveGasPrice;
  String? gasUsed;

  OHOTransaction({
    required this.status,
    required this.type,
    this.submitDate,
    this.networkKey,
    this.networkCurrencySymbol,
    this.tokenKey,
    this.tokenAddress,
    this.tokenSymbol,
    this.tokenAmount,
    this.tokenDecimals,
    this.from,
    this.to,
    this.hash,
    this.blockNumber,
    this.blockDate,
    this.nonce,
    this.input,
    this.value,
    this.gasPrice,
    this.effectiveGasPrice,
    this.gasUsed,
  });

  factory OHOTransaction.fromJson(Map<String, dynamic> json) =>
      _$OHOTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$OHOTransactionToJson(this);
}
