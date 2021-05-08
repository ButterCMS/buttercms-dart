import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving tags
class Tags {
  final String _apiKey;

  Tags(this._apiKey);

  /// Retrieves a single page from Pages
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> retrieve([
    Map<String, String>? params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};
    return get(Uri.https(baseUrl, "$tagsEndpoint", params));
  }

  /// Retrieves multiple pages from a pageType of Pages
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> list([
    Map<String, String>? params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};
    return get(Uri.https(baseUrl, "$tagsEndpoint", params));
  }
}
