import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving authors
class Authors {
  final String _apiKey;

  Authors(this._apiKey);

  /// Retrieves a single author using slug
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> retrieve([
    Map<String, String> params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};
    return get(Uri.https(baseUrl, "$authorsEndpoint", params));
  }

  /// Lists all authors
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> list([
    Map<String, String> params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};
    return get(Uri.https(baseUrl, "$authorsEndpoint", params));
  }
}
