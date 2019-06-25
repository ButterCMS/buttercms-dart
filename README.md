# buttercms_flutter

The official ButterCMS package for Flutter.

## Documentation 

For a comprehensive list of examples, check out the [API documentation](https://buttercms.com/docs/api/).

## Overview

Every resource is accessed via your butter instance:

    Butter butter = Butter('YOUR_API_KEY');

   OR 

    var butter = Butter('YOUR_API_KEY');

Every resource method returns a Future:

    // Get blog posts
    butter.post.list(page: 1, page_size: 10).then((response) {
      print(response);
    });
    
## Content fields

content
    retrieve(keys)
    
### Localization

Setup locales in the ButterCMS dashboard and fetch localized content using the locale option:

    // Get FAQ
    butter.content.retrieve(["faq"], locale: 'es').then((resp) {
      print(resp);
    });

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