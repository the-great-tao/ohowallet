import 'package:ohowallet/core/exports.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:intl/intl.dart';

enum SentReceived {
  sent,
  received,
}

class OHOWalletService extends GetxService{
  Future<OHOWalletService> init() async {
    return this;
  }
  static const address = '0x162BFDc8F122dcc2939E26f43D4b1DdcD6a96eB4';

  static const transferApiUrl =
      'https://deep-index.moralis.io/api/v2/$address/erc20';
  static const tokenMetadataApiUrl =
      'https://deep-index.moralis.io/api/v2/erc20';

  static const transferNftApiUrl = 'https://deep-index.moralis.io/api/v2/$address';

  final options = CacheOptions(
    // A default store is required for interceptor.
    store: MemCacheStore(),

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.request,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 7),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  Future<Map<String, dynamic>?> moralistApiCall({
    required String method,
    required Map<String, dynamic> params,
  }) async {
    try {
      String apiURL = '';
      switch (method) {
        case 'transfers':
          {
            apiURL = '$transferApiUrl/transfers';
          }
          break;

        case 'metadata':
          {
            apiURL = '$tokenMetadataApiUrl/metadata';
          }
          break;

        case 'getWalletNFTs':
          {
            apiURL = '$transferNftApiUrl/nft';
          }
          break;
      }

      //prepare params
      params['chain'] = 'polygon';

      final dio = Dio()..interceptors.add(DioCacheInterceptor(options: options));

      var response = await dio.get(
        apiURL,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'X-API-Key': 'test'
        }),
        queryParameters: params,
      );

      final dataType = response.data.runtimeType.toString();
      if (dataType == '_InternalLinkedHashMap<String, dynamic>') {
        return jsonDecode(response.toString());
      } else if (dataType == 'List<dynamic>') {
        return (response.data as List<dynamic>)[0];
        // print(response.data as List<dynamic>);
        // return jsonDecode((response.data as List<dynamic>)[0].toString());
      }
    } on DioError catch (error) {
      print(error.response);
      return null;
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> moralisGetWalletTokenTransfer({
    String? cursor,
    int? limit,
  }) async {
    final Map<String, dynamic> params = {};

    if (cursor != null) {
      params['cursor'] = cursor;
    }
    params['limit'] = limit ?? 10;

    return moralistApiCall(
      method: 'transfers',
      params: params,
    );
  }

  Future<Map<String, dynamic>?> moralisGetTokenMetadata({
    String? addresses,
  }) async {
    final Map<String, dynamic> params = {};

    if (addresses != null) {
      params['addresses'] = addresses;
    }

    return moralistApiCall(
      method: 'metadata',
      params: params,
    );
  }

  Future<Map<String, dynamic>?> moralisGetWalletNFTs({
    String? cursor,
    int? limit,
    String? format,
  }) async {
    final Map<String, dynamic> params = {};

    if (cursor != null) {
      params['cursor'] = cursor;
    }
    params['limit'] = limit ?? 10;
    params['format'] = format ?? 'decimal';

    return moralistApiCall(
      method: 'getWalletNFTs',
      params: params,
    );
  }

  String handleDateString(String date) {
    try {
      var newStr = '${date.substring(0, 10)} ${date.substring(11, 23)}';
      DateTime dt = DateTime.parse(newStr);
      final DateFormat formatter = DateFormat('LLLL d, yyyy HH:mm a');
      final String formatted = formatter.format(dt);
      return formatted;
    } catch (e) {
      print(e);
      return '';
    }
  }

  static SentReceived sendOrReceived(String fromAddress, String toAddress) {
    if (fromAddress == address) {
      return SentReceived.sent;
    } else {
      return SentReceived.received;
    }
  }
}
