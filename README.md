# buttercms_dart

The official ButterCMS package for Flutter.

## Documentation 

For a comprehensive list of examples, check out the [API documentation](https://buttercms.com/docs/api/).

## Overview

Every resource is accessed via your butter instance:

```dart
Butter butter = Butter('YOUR_API_KEY');

OR 

var butter = Butter('YOUR_API_KEY');
```

Every resource method returns a Future:

```dart
// Get blog posts
butter.post.list({'page': '1', 'pageSize': '10'}).then((response) {
  print(response);
});
```

## Pages

   * page
      *     retrieve(page_type, page_slug[, params])
      *     list(page_type[, params])

```dart
// Get page
butter.page.retrieve('casestudy', 'acme-co').then((response) {
  print(response);
});
```

## Content fields

   * content
      *     retrieve(keys)
      
```dart
// Get FAQ
butter.content.retrieve(["demo-key"]).then((resp) {
  print(resp);
});
```
    
### Localization

Setup locales in the ButterCMS dashboard and fetch localized content using the locale option:

```dart
// Get FAQ
butter.content.retrieve(["faq"], {'locale': 'es'}).then((resp) {
  print(resp);
});
```

## Blog Engine

#### post

    retrieve(slug[, params])
    
    list([params])
    
    search(query[, params])
    
#### category

    retrieve(slug[, params])
    
    list([params])
    
#### tag

    retrieve(slug[, params])
    
    list([params])
    
#### author

    retrieve(slug[, params])
    
    list([params])