import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving categories
class Categories {
  final String _apiKey;

  Categories(this._apiKey);

  /// Retrieves a single category using slug
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> retrieve([
    Map<String, String>? params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};
    return get(Uri.https(baseUrl, "$categoriesEndpoint", params));
  }

  /// Lists all categories
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> list([
    Map<String, String>? params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};
    return get(Uri.https(baseUrl, "$categoriesEndpoint", params));
  }
}
