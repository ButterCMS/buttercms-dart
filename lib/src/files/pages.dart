import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving data from pages
class Pages {
  final String _apiKey;

  Pages(this._apiKey);

  /// Retrieves a single page from Pages
  /// [pageType] fetches pages with the given page type slug
  /// [pageSlug] fetches a specific page with the given slug
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> retrieve(
    String pageType,
    String pageSlug, [
    Map<String, String> params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};

    return get(
        Uri.https(baseUrl, "$pagesEndpoint/$pageType/$pageSlug", params));
  }

  /// Retrieves multiple pages from a pageType of Pages
  /// [pageType] fetches pages with the given page type slug
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> list(
    String pageType, [
    Map<String, String> params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};

    return get(Uri.https(baseUrl, "$pagesEndpoint/$pageType", params));
  }
}
