import 'package:http/http.dart';
import 'package:buttercms_flutter/src/files/butter_constants.dart';

/// Helper class for retrieving categories
class Categories {
  final String _apiKey;

  Categories(this._apiKey);

  /// Retrieves a single category using slug
  /// [slug] indicates the unique category slug
  /// [include] indicates details to include in response (try include: recent_posts)
  Future<Response> retrieve({
    String slug,
    String include,
  }) {
    Map<String, String> params = {"auth_token": _apiKey, "slug": slug};
    if (include != null) params["include"] = include;
    return get(Uri.https(baseUrl, "$categoriesEndpoint", params));
  }

  /// Lists all categories
  /// [include] indicates details to include in response (try include: recent_posts)
  Future<Response> list({
    String include,
  }) {
    Map<String, String> params = {"auth_token": _apiKey};
    if (include != null) params["include"] = include;
    return get(Uri.https(baseUrl, "$categoriesEndpoint", params));
  }
}
