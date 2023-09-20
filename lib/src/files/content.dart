import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving data from collections
class Content {
  final String _apiKey;

  Content(this._apiKey);

  /// Retrieves tables from Collections
  /// [keys] is a list of all the collections to retrieve
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> retrieve(
    List<String> keys, [
    Map<String, String>? params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};

    String param = "";
    for (int i = 0; i < keys.length; i++) {
      param = param + keys[i];
      if (i != keys.length - 1) {
        param = param + ",";
      }
    }
    params["keys"] = param;

    return get(Uri.https(baseUrl, "$contentEndpoint", params));
  }
}
