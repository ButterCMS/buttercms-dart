import 'package:http/http.dart';
import 'package:buttercms_flutter/src/files/butter_constants.dart';

/// Helper class for retrieving blog posts
class Posts {
  final String _apiKey;

  Posts(this._apiKey);

  /// Retrieves a single post using slug
  Future<Response> retrieve(String slug) {
    Map<String, String> params = {"auth_token": _apiKey, "slug": slug};

    print(Uri.https(baseUrl, "$postsEndpoint/$slug", params).toString());
    return get(Uri.https(baseUrl, "$postsEndpoint/$slug", params));
  }

  /// Lists multiple posts according to page size
  /// [page] is the current page to be retrieved
  /// [pageSize] gives the size of the page to be retrieved
  /// [excludeBody] allows exclusion of the entire post body
  /// [authorSlug], [categorySlug], [tagSlug] are respective unique slugs
  Future<Response> list({
    int page,
    int pageSize,
    bool excludeBody,
    String authorSlug,
    String categorySlug,
    String tagSlug,
  }) {
    Map<String, String> params = {"auth_token": _apiKey};
    if (page != null) params["page"] = page.toString();
    if (page != null) params["page_size"] = pageSize.toString();
    if (excludeBody != null) params["exclude_body"] = excludeBody.toString();
    if (authorSlug != null) params["author_slug"] = authorSlug;
    if (categorySlug != null) params["category_slug"] = categorySlug;
    if (tagSlug != null) params["tag_slug"] = tagSlug;

    return get(Uri.https(baseUrl, "$postsEndpoint", params));
  }

  /// Searches for posts using search query
  /// [page] is the current page to be retrieved
  /// [pageSize] gives the size of the page to be retrieved
  Future<Response> search(
    String query, {
    int page,
    int pageSize,
  }) {
    Map<String, String> params = {"query": query, "auth_token": _apiKey};

    if (page != null) params["page"] = page.toString();
    if (page != null) params["pageSize"] = pageSize.toString();

    return get(Uri.https(baseUrl, "$postsEndpoint", params));
  }
}
