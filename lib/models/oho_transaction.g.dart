// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oho_transaction.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetOHOTransactionCollection on Isar {
  IsarCollection<OHOTransaction> get ohoTransactions => this.collection();
}

const OHOTransactionSchema = CollectionSchema(
  name: r'OHOTransaction',
  id: 7037685164189282557,
  properties: {
    r'blockDate': PropertySchema(
      id: 0,
      name: r'blockDate',
      type: IsarType.dateTime,
    ),
    r'blockNumber': PropertySchema(
      id: 1,
      name: r'blockNumber',
      type: IsarType.long,
    ),
    r'effectiveGasPrice': PropertySchema(
      id: 2,
      name: r'effectiveGasPrice',
      type: IsarType.string,
    ),
    r'from': PropertySchema(
      id: 3,
      name: r'from',
      type: IsarType.string,
    ),
    r'gasPrice': PropertySchema(
      id: 4,
      name: r'gasPrice',
      type: IsarType.string,
    ),
    r'gasUsed': PropertySchema(
      id: 5,
      name: r'gasUsed',
      type: IsarType.string,
    ),
    r'hash': PropertySchema(
      id: 6,
      name: r'hash',
      type: IsarType.string,
    ),
    r'networkKey': PropertySchema(
      id: 7,
      name: r'networkKey',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.string,
      enumMap: _OHOTransactionstatusEnumValueMap,
    ),
    r'to': PropertySchema(
      id: 9,
      name: r'to',
      type: IsarType.string,
    ),
    r'tokenAddress': PropertySchema(
      id: 10,
      name: r'tokenAddress',
      type: IsarType.string,
    ),
    r'tokenAmount': PropertySchema(
      id: 11,
      name: r'tokenAmount',
      type: IsarType.string,
    ),
    r'tokenKey': PropertySchema(
      id: 12,
      name: r'tokenKey',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 13,
      name: r'type',
      type: IsarType.string,
      enumMap: _OHOTransactiontypeEnumValueMap,
    ),
    r'value': PropertySchema(
      id: 14,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _oHOTransactionEstimateSize,
  serialize: _oHOTransactionSerialize,
  deserialize: _oHOTransactionDeserialize,
  deserializeProp: _oHOTransactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'networkKey': IndexSchema(
      id: -7056945717654388473,
      name: r'networkKey',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'networkKey',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'tokenKey': IndexSchema(
      id: -2104708872323917900,
      name: r'tokenKey',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tokenKey',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'tokenAddress': IndexSchema(
      id: 5520351557348357672,
      name: r'tokenAddress',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tokenAddress',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'from': IndexSchema(
      id: 8620904236416672158,
      name: r'from',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'from',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'to': IndexSchema(
      id: 8585794172020190459,
      name: r'to',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'to',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'hash': IndexSchema(
      id: -7973251393006690288,
      name: r'hash',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hash',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'blockNumber': IndexSchema(
      id: -5083751828762991580,
      name: r'blockNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'blockNumber',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'blockDate': IndexSchema(
      id: -4009902433291264408,
      name: r'blockDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'blockDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _oHOTransactionGetId,
  getLinks: _oHOTransactionGetLinks,
  attach: _oHOTransactionAttach,
  version: '3.0.2',
);

int _oHOTransactionEstimateSize(
  OHOTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.effectiveGasPrice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.from;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gasPrice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gasUsed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.networkKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.to;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tokenAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tokenAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tokenKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _oHOTransactionSerialize(
  OHOTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.blockDate);
  writer.writeLong(offsets[1], object.blockNumber);
  writer.writeString(offsets[2], object.effectiveGasPrice);
  writer.writeString(offsets[3], object.from);
  writer.writeString(offsets[4], object.gasPrice);
  writer.writeString(offsets[5], object.gasUsed);
  writer.writeString(offsets[6], object.hash);
  writer.writeString(offsets[7], object.networkKey);
  writer.writeString(offsets[8], object.status.name);
  writer.writeString(offsets[9], object.to);
  writer.writeString(offsets[10], object.tokenAddress);
  writer.writeString(offsets[11], object.tokenAmount);
  writer.writeString(offsets[12], object.tokenKey);
  writer.writeString(offsets[13], object.type.name);
  writer.writeString(offsets[14], object.value);
}

OHOTransaction _oHOTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OHOTransaction(
    blockDate: reader.readDateTimeOrNull(offsets[0]),
    blockNumber: reader.readLongOrNull(offsets[1]),
    effectiveGasPrice: reader.readStringOrNull(offsets[2]),
    from: reader.readStringOrNull(offsets[3]),
    gasPrice: reader.readStringOrNull(offsets[4]),
    gasUsed: reader.readStringOrNull(offsets[5]),
    hash: reader.readStringOrNull(offsets[6]),
    networkKey: reader.readStringOrNull(offsets[7]),
    status: _OHOTransactionstatusValueEnumMap[
            reader.readStringOrNull(offsets[8])] ??
        OHOTransactionStatus.none,
    to: reader.readStringOrNull(offsets[9]),
    tokenAddress: reader.readStringOrNull(offsets[10]),
    tokenAmount: reader.readStringOrNull(offsets[11]),
    tokenKey: reader.readStringOrNull(offsets[12]),
    type:
        _OHOTransactiontypeValueEnumMap[reader.readStringOrNull(offsets[13])] ??
            OHOTransactionType.none,
    value: reader.readStringOrNull(offsets[14]),
  );
  object.id = id;
  return object;
}

P _oHOTransactionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_OHOTransactionstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          OHOTransactionStatus.none) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (_OHOTransactiontypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          OHOTransactionType.none) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OHOTransactionstatusEnumValueMap = {
  r'none': r'none',
  r'sending': r'sending',
  r'pending': r'pending',
  r'pendingHistory': r'pendingHistory',
  r'successful': r'successful',
  r'failed': r'failed',
};
const _OHOTransactionstatusValueEnumMap = {
  r'none': OHOTransactionStatus.none,
  r'sending': OHOTransactionStatus.sending,
  r'pending': OHOTransactionStatus.pending,
  r'pendingHistory': OHOTransactionStatus.pendingHistory,
  r'successful': OHOTransactionStatus.successful,
  r'failed': OHOTransactionStatus.failed,
};
const _OHOTransactiontypeEnumValueMap = {
  r'none': r'none',
  r'swapToken': r'swapToken',
  r'sendToken': r'sendToken',
  r'sendNFT': r'sendNFT',
};
const _OHOTransactiontypeValueEnumMap = {
  r'none': OHOTransactionType.none,
  r'swapToken': OHOTransactionType.swapToken,
  r'sendToken': OHOTransactionType.sendToken,
  r'sendNFT': OHOTransactionType.sendNFT,
};

Id _oHOTransactionGetId(OHOTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _oHOTransactionGetLinks(OHOTransaction object) {
  return [];
}

void _oHOTransactionAttach(
    IsarCollection<dynamic> col, Id id, OHOTransaction object) {
  object.id = id;
}

extension OHOTransactionByIndex on IsarCollection<OHOTransaction> {
  Future<OHOTransaction?> getByHash(String? hash) {
    return getByIndex(r'hash', [hash]);
  }

  OHOTransaction? getByHashSync(String? hash) {
    return getByIndexSync(r'hash', [hash]);
  }

  Future<bool> deleteByHash(String? hash) {
    return deleteByIndex(r'hash', [hash]);
  }

  bool deleteByHashSync(String? hash) {
    return deleteByIndexSync(r'hash', [hash]);
  }

  Future<List<OHOTransaction?>> getAllByHash(List<String?> hashValues) {
    final values = hashValues.map((e) => [e]).toList();
    return getAllByIndex(r'hash', values);
  }

  List<OHOTransaction?> getAllByHashSync(List<String?> hashValues) {
    final values = hashValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'hash', values);
  }

  Future<int> deleteAllByHash(List<String?> hashValues) {
    final values = hashValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'hash', values);
  }

  int deleteAllByHashSync(List<String?> hashValues) {
    final values = hashValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'hash', values);
  }

  Future<Id> putByHash(OHOTransaction object) {
    return putByIndex(r'hash', object);
  }

  Id putByHashSync(OHOTransaction object, {bool saveLinks = true}) {
    return putByIndexSync(r'hash', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByHash(List<OHOTransaction> objects) {
    return putAllByIndex(r'hash', objects);
  }

  List<Id> putAllByHashSync(List<OHOTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'hash', objects, saveLinks: saveLinks);
  }
}

extension OHOTransactionQueryWhereSort
    on QueryBuilder<OHOTransaction, OHOTransaction, QWhere> {
  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyNetworkKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'networkKey'),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyTokenKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tokenKey'),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyTokenAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tokenAddress'),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'from'),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'to'),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'blockNumber'),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhere> anyBlockDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'blockDate'),
      );
    });
  }
}

extension OHOTransactionQueryWhere
    on QueryBuilder<OHOTransaction, OHOTransaction, QWhereClause> {
  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'networkKey',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'networkKey',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyEqualTo(String? networkKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'networkKey',
        value: [networkKey],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyNotEqualTo(String? networkKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'networkKey',
              lower: [],
              upper: [networkKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'networkKey',
              lower: [networkKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'networkKey',
              lower: [networkKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'networkKey',
              lower: [],
              upper: [networkKey],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyGreaterThan(
    String? networkKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'networkKey',
        lower: [networkKey],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyLessThan(
    String? networkKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'networkKey',
        lower: [],
        upper: [networkKey],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyBetween(
    String? lowerNetworkKey,
    String? upperNetworkKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'networkKey',
        lower: [lowerNetworkKey],
        includeLower: includeLower,
        upper: [upperNetworkKey],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyStartsWith(String NetworkKeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'networkKey',
        lower: [NetworkKeyPrefix],
        upper: ['$NetworkKeyPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'networkKey',
        value: [''],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      networkKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'networkKey',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'networkKey',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'networkKey',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'networkKey',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tokenKey',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenKey',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyEqualTo(String? tokenKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tokenKey',
        value: [tokenKey],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyNotEqualTo(String? tokenKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenKey',
              lower: [],
              upper: [tokenKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenKey',
              lower: [tokenKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenKey',
              lower: [tokenKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenKey',
              lower: [],
              upper: [tokenKey],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyGreaterThan(
    String? tokenKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenKey',
        lower: [tokenKey],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyLessThan(
    String? tokenKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenKey',
        lower: [],
        upper: [tokenKey],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyBetween(
    String? lowerTokenKey,
    String? upperTokenKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenKey',
        lower: [lowerTokenKey],
        includeLower: includeLower,
        upper: [upperTokenKey],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyStartsWith(String TokenKeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenKey',
        lower: [TokenKeyPrefix],
        upper: ['$TokenKeyPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tokenKey',
        value: [''],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tokenKey',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tokenKey',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tokenKey',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tokenKey',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tokenAddress',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenAddress',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressEqualTo(String? tokenAddress) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tokenAddress',
        value: [tokenAddress],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressNotEqualTo(String? tokenAddress) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenAddress',
              lower: [],
              upper: [tokenAddress],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenAddress',
              lower: [tokenAddress],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenAddress',
              lower: [tokenAddress],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tokenAddress',
              lower: [],
              upper: [tokenAddress],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressGreaterThan(
    String? tokenAddress, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenAddress',
        lower: [tokenAddress],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressLessThan(
    String? tokenAddress, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenAddress',
        lower: [],
        upper: [tokenAddress],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressBetween(
    String? lowerTokenAddress,
    String? upperTokenAddress, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenAddress',
        lower: [lowerTokenAddress],
        includeLower: includeLower,
        upper: [upperTokenAddress],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressStartsWith(String TokenAddressPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tokenAddress',
        lower: [TokenAddressPrefix],
        upper: ['$TokenAddressPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tokenAddress',
        value: [''],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      tokenAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tokenAddress',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tokenAddress',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tokenAddress',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tokenAddress',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> fromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'from',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      fromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'from',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> fromEqualTo(
      String? from) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'from',
        value: [from],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      fromNotEqualTo(String? from) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'from',
              lower: [],
              upper: [from],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'from',
              lower: [from],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'from',
              lower: [from],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'from',
              lower: [],
              upper: [from],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      fromGreaterThan(
    String? from, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'from',
        lower: [from],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> fromLessThan(
    String? from, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'from',
        lower: [],
        upper: [from],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> fromBetween(
    String? lowerFrom,
    String? upperFrom, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'from',
        lower: [lowerFrom],
        includeLower: includeLower,
        upper: [upperFrom],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      fromStartsWith(String FromPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'from',
        lower: [FromPrefix],
        upper: ['$FromPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      fromIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'from',
        value: [''],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      fromIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'from',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'from',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'from',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'from',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'to',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      toIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'to',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toEqualTo(
      String? to) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'to',
        value: [to],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toNotEqualTo(
      String? to) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'to',
              lower: [],
              upper: [to],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'to',
              lower: [to],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'to',
              lower: [to],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'to',
              lower: [],
              upper: [to],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toGreaterThan(
    String? to, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'to',
        lower: [to],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toLessThan(
    String? to, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'to',
        lower: [],
        upper: [to],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toBetween(
    String? lowerTo,
    String? upperTo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'to',
        lower: [lowerTo],
        includeLower: includeLower,
        upper: [upperTo],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toStartsWith(
      String ToPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'to',
        lower: [ToPrefix],
        upper: ['$ToPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> toIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'to',
        value: [''],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      toIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'to',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'to',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'to',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'to',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> hashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hash',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      hashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hash',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause> hashEqualTo(
      String? hash) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hash',
        value: [hash],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      hashNotEqualTo(String? hash) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hash',
              lower: [],
              upper: [hash],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hash',
              lower: [hash],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hash',
              lower: [hash],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hash',
              lower: [],
              upper: [hash],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'blockNumber',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockNumber',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockNumberEqualTo(int? blockNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'blockNumber',
        value: [blockNumber],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockNumberNotEqualTo(int? blockNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockNumber',
              lower: [],
              upper: [blockNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockNumber',
              lower: [blockNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockNumber',
              lower: [blockNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockNumber',
              lower: [],
              upper: [blockNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockNumberGreaterThan(
    int? blockNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockNumber',
        lower: [blockNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockNumberLessThan(
    int? blockNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockNumber',
        lower: [],
        upper: [blockNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockNumberBetween(
    int? lowerBlockNumber,
    int? upperBlockNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockNumber',
        lower: [lowerBlockNumber],
        includeLower: includeLower,
        upper: [upperBlockNumber],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'blockDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockDateEqualTo(DateTime? blockDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'blockDate',
        value: [blockDate],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockDateNotEqualTo(DateTime? blockDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockDate',
              lower: [],
              upper: [blockDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockDate',
              lower: [blockDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockDate',
              lower: [blockDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockDate',
              lower: [],
              upper: [blockDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockDateGreaterThan(
    DateTime? blockDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockDate',
        lower: [blockDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockDateLessThan(
    DateTime? blockDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockDate',
        lower: [],
        upper: [blockDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterWhereClause>
      blockDateBetween(
    DateTime? lowerBlockDate,
    DateTime? upperBlockDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockDate',
        lower: [lowerBlockDate],
        includeLower: includeLower,
        upper: [upperBlockDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OHOTransactionQueryFilter
    on QueryBuilder<OHOTransaction, OHOTransaction, QFilterCondition> {
  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blockDate',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blockDate',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blockNumber',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blockNumber',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      blockNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveGasPrice',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveGasPrice',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveGasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveGasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveGasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveGasPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'effectiveGasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'effectiveGasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'effectiveGasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'effectiveGasPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveGasPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      effectiveGasPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'effectiveGasPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'from',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'from',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'from',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'from',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      fromIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'from',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gasPrice',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gasPrice',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gasPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gasUsed',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gasUsed',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gasUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasUsed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      gasUsedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hash',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hash',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hash',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      hashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hash',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'networkKey',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'networkKey',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'networkKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'networkKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'networkKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'networkKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'networkKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'networkKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'networkKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'networkKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'networkKey',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      networkKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'networkKey',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusEqualTo(
    OHOTransactionStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusGreaterThan(
    OHOTransactionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusLessThan(
    OHOTransactionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusBetween(
    OHOTransactionStatus lower,
    OHOTransactionStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'to',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'to',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition> toEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition> toBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'to',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition> toMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'to',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      toIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'to',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenAddress',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenAddress',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenAmount',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenAmount',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenKey',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenKey',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenKey',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      tokenKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenKey',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeEqualTo(
    OHOTransactionType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeGreaterThan(
    OHOTransactionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeLessThan(
    OHOTransactionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeBetween(
    OHOTransactionType lower,
    OHOTransactionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension OHOTransactionQueryObject
    on QueryBuilder<OHOTransaction, OHOTransaction, QFilterCondition> {}

extension OHOTransactionQueryLinks
    on QueryBuilder<OHOTransaction, OHOTransaction, QFilterCondition> {}

extension OHOTransactionQuerySortBy
    on QueryBuilder<OHOTransaction, OHOTransaction, QSortBy> {
  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByBlockDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockDate', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByBlockDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockDate', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByEffectiveGasPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveGasPrice', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByEffectiveGasPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveGasPrice', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByGasPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasPrice', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByGasPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasPrice', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByNetworkKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkKey', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByNetworkKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkKey', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByTokenAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAddress', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByTokenAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAddress', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByTokenAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByTokenAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByTokenKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenKey', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      sortByTokenKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenKey', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension OHOTransactionQuerySortThenBy
    on QueryBuilder<OHOTransaction, OHOTransaction, QSortThenBy> {
  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByBlockDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockDate', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByBlockDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockDate', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByEffectiveGasPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveGasPrice', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByEffectiveGasPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveGasPrice', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByGasPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasPrice', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByGasPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasPrice', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByNetworkKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkKey', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByNetworkKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkKey', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByTokenAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAddress', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByTokenAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAddress', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByTokenAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByTokenAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAmount', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByTokenKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenKey', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy>
      thenByTokenKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenKey', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension OHOTransactionQueryWhereDistinct
    on QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> {
  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct>
      distinctByBlockDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockDate');
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct>
      distinctByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockNumber');
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct>
      distinctByEffectiveGasPrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveGasPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByFrom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'from', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByGasPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasPrice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByGasUsed(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasUsed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByNetworkKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'networkKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByTo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'to', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct>
      distinctByTokenAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByTokenAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenAmount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByTokenKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OHOTransaction, OHOTransaction, QDistinct> distinctByValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value', caseSensitive: caseSensitive);
    });
  }
}

extension OHOTransactionQueryProperty
    on QueryBuilder<OHOTransaction, OHOTransaction, QQueryProperty> {
  QueryBuilder<OHOTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OHOTransaction, DateTime?, QQueryOperations>
      blockDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockDate');
    });
  }

  QueryBuilder<OHOTransaction, int?, QQueryOperations> blockNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockNumber');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations>
      effectiveGasPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveGasPrice');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> fromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'from');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> gasPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasPrice');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> gasUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasUsed');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> hashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hash');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> networkKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'networkKey');
    });
  }

  QueryBuilder<OHOTransaction, OHOTransactionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> toProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'to');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations>
      tokenAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenAddress');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations>
      tokenAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenAmount');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> tokenKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenKey');
    });
  }

  QueryBuilder<OHOTransaction, OHOTransactionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<OHOTransaction, String?, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OHOTransaction _$OHOTransactionFromJson(Map<String, dynamic> json) =>
    OHOTransaction(
      status: $enumDecode(_$OHOTransactionStatusEnumMap, json['status']),
      type: $enumDecode(_$OHOTransactionTypeEnumMap, json['type']),
      networkKey: json['networkKey'] as String?,
      tokenKey: json['tokenKey'] as String?,
      tokenAddress: json['tokenAddress'] as String?,
      tokenAmount: json['tokenAmount'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      hash: json['hash'] as String?,
      blockNumber: json['blockNumber'] as int?,
      blockDate: json['blockDate'] == null
          ? null
          : DateTime.parse(json['blockDate'] as String),
      value: json['value'] as String?,
      gasPrice: json['gasPrice'] as String?,
      effectiveGasPrice: json['effectiveGasPrice'] as String?,
      gasUsed: json['gasUsed'] as String?,
    )..id = json['id'] as int;

Map<String, dynamic> _$OHOTransactionToJson(OHOTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OHOTransactionStatusEnumMap[instance.status]!,
      'type': _$OHOTransactionTypeEnumMap[instance.type]!,
      'networkKey': instance.networkKey,
      'tokenKey': instance.tokenKey,
      'tokenAddress': instance.tokenAddress,
      'from': instance.from,
      'to': instance.to,
      'hash': instance.hash,
      'blockNumber': instance.blockNumber,
      'blockDate': instance.blockDate?.toIso8601String(),
      'value': instance.value,
      'tokenAmount': instance.tokenAmount,
      'gasPrice': instance.gasPrice,
      'effectiveGasPrice': instance.effectiveGasPrice,
      'gasUsed': instance.gasUsed,
    };

const _$OHOTransactionStatusEnumMap = {
  OHOTransactionStatus.none: 'none',
  OHOTransactionStatus.sending: 'sending',
  OHOTransactionStatus.pending: 'pending',
  OHOTransactionStatus.pendingHistory: 'pendingHistory',
  OHOTransactionStatus.successful: 'successful',
  OHOTransactionStatus.failed: 'failed',
};

const _$OHOTransactionTypeEnumMap = {
  OHOTransactionType.none: 'none',
  OHOTransactionType.swapToken: 'swapToken',
  OHOTransactionType.sendToken: 'sendToken',
  OHOTransactionType.sendNFT: 'sendNFT',
};
