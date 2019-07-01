import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving data from pages
class Pages {
  final String _apiKey;

  Pages(this._apiKey);

  /// Retrieves a single page from Pages
  /// [pageType] fetches pages with the given page type slug
  /// [pageSlug] fetches a specific page with the given slug
  /// [locale] allows retrieval of different locales
  Future<Response> retrieve(
    String pageType,
    String pageSlug, {
    String locale,
    int preview,
  }) {
    Map<String, String> params = {"auth_token": _apiKey};
    if (locale != null) params["locale"] = locale;
    if (preview != null) params["preview"] = preview.toString();

    return get(
        Uri.https(baseUrl, "$pagesEndpoint/$pageType/$pageSlug", params));
  }

  /// Retrieves multiple pages from a pageType of Pages
  /// [page] is the current page to be retrieved
  /// [pageSize] gives the size of the page to be retrieved
  /// [locale] allows retrieval of different locales
  /// [levels] defines the number of levels to serialise
  Future<Response> list(
    String pageType, {
    int page,
    int pageSize,
    String locale,
    int preview,
    int levels,
    String order,
    Map<String, String> fieldKeyMap = const {},
  }) {
    Map<String, String> params = {"auth_token": _apiKey};
    if (page != null) params["page"] = page.toString();
    if (pageSize != null) params["page_size"] = pageSize.toString();
    if (locale != null) params["locale"] = locale;
    if (preview != null) params["preview"] = preview.toString();

    fieldKeyMap.forEach((key, value) {
      params[key] = value;
    });
    return get(Uri.https(baseUrl, "$pagesEndpoint/$pageType", params));
  }
}
