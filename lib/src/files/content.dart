import 'package:http/http.dart';
import 'package:buttercms_flutter/src/files/butter_constants.dart';

/// Helper class for retrieving data from collections
class Content {
  final String _apiKey;

  Content(this._apiKey);

  /// Retrieves tables from Collections
  /// [keys] is a list of all the collections to retrieve
  /// [locale] allows retrieval of different locales
  Future<Response> retrieve(
    List<String> keys, {
    String locale,
    int preview,
  }) {
    Map<String, String> params = {"auth_token": _apiKey};
    if (keys != null) {
      String param = "";
      for (int i = 0; i < keys.length; i++) {
        param = param + keys[i];
        if (i != keys.length - 1) {
          param = param + ",";
        }
      }
      params["keys"] = param;
    }
    if (locale != null) {
      params["locale"] = locale;
    }
    if (preview != null) {
      params["preview"] = preview.toString();
    }
    return get(Uri.https(baseUrl, "$contentEndpoint", params));
  }
}
