import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving tags
class Tags {
  final String _apiKey;

  Tags(this._apiKey);

  /// Retrieves a single page from Pages
  /// [slug] indicates the unique tag slug
  /// [include] indicates details to include in response (try include: recent_posts)
  Future<Response> retrieve({
    String slug,
    String include,
  }) {
    Map<String, String> params = {"auth_token": _apiKey, "slug": slug};
    if (include != null) params["include"] = include;
    return get(Uri.https(baseUrl, "$tagsEndpoint", params));
  }

  /// Retrieves multiple pages from a pageType of Pages
  /// [include] indicates details to include in response (try include: recent_posts)
  Future<Response> list({
    String include,
  }) {
    Map<String, String> params = {"auth_token": _apiKey};
    if (include != null) params["include"] = include;
    return get(Uri.https(baseUrl, "$tagsEndpoint", params));
  }
}
