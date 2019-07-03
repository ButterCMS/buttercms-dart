import 'package:http/http.dart';
import 'package:buttercms_dart/src/files/butter_constants.dart';

/// Helper class for retrieving blog posts
class Posts {
  final String _apiKey;

  Posts(this._apiKey);

  /// Retrieves a single post using slug
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> retrieve(
    String slug, [
    Map<String, String> params,
  ]) {
    if (params != null) {
      params["auth_token"] = _apiKey;
      params["slug"] = slug;
    } else
      params = {"auth_token": _apiKey, "slug": slug};

    return get(Uri.https(baseUrl, "$postsEndpoint/$slug", params));
  }

  /// Lists multiple posts according to page size
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> list([
    Map<String, String> params,
  ]) {
    if (params != null)
      params["auth_token"] = _apiKey;
    else
      params = {"auth_token": _apiKey};
    return get(Uri.https(baseUrl, "$postsEndpoint", params));
  }

  /// Searches for posts using search query
  /// [query] is the string used for search
  /// [params] is a Map used to add additional parameters to the query
  Future<Response> search(
    String query, [
    Map<String, String> params,
  ]) {
    if (params != null) {
      params["auth_token"] = _apiKey;
      params["query"] = query;
    } else
      params = {"auth_token": _apiKey, "query": query};

    return get(Uri.https(baseUrl, "$postsEndpoint", params));
  }
}
