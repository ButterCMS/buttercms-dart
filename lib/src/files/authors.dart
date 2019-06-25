import 'package:http/http.dart';
import 'package:buttercms_flutter/src/files/butter_constants.dart';

/// Helper class for retrieving authors
class Authors {
  final String _apiKey;

  Authors(this._apiKey);

  /// Retrieves a single author using slug
  /// [slug] indicates the unique author slug
  /// [include] indicates details to include in response (try include: recent_posts)
  Future<Response> retrieve({
    String slug,
    String include,
  }) {
    Map<String, String> params = {"auth_token": _apiKey, "slug": slug};
    if (include != null) params["include"] = include;
    return get(Uri.https(baseUrl, "$authorsEndpoint", params));
  }

  /// Lists all authors
  /// [include] indicates details to include in response (try include: recent_posts)
  Future<Response> list({
    String include,
  }) {
    Map<String, String> params = {"auth_token": _apiKey};
    if (include != null) params["include"] = include;
    return get(Uri.https(baseUrl, "$authorsEndpoint", params));
  }
}
