import 'package:ohowallet/core/exports.dart';

class IsarService extends GetxService {
  late Isar isar;

  IsarCollection get ohoTransactions => isar.ohoTransactions;

  Future<IsarService> init() async {
    isar = await Isar.open([OHOTransactionSchema]);
    // isar.close(deleteFromDisk: true);
    return this;
  }
}
