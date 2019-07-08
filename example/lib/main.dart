import 'package:flutter/material.dart';
import 'package:buttercms_dart/buttercms_dart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ButterCMS Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Initialising Butter
  Butter butter = Butter("YOUR_API_KEY");

  // Result of query (Usually, this result is parsed into respective model)
  String result = "";

  @override
  void initState() {
    super.initState();
    _getPosts().then((value) {
      setState(() {
        // Value passed as Response
        result = value.body;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(result),
      ),
    );
  }

  // Get a specific post or list posts
  Future _getPosts() {
    return butter.post.list();
  }

  // Get data from one or more collections
  Future _getCollections() {
    return butter.content.retrieve(["YOUR_COLLECTION_NAME"]);
  }

  // Get one or more pages
  Future _getPages() {
    return butter.page.list("PAGE_TYPE_SLUG");
  }

  // Retrieve one or more authors
  Future _getAuthors() {
    return butter.author.list();
  }

  // Retrieve one or more tags
  Future _getTags() {
    return butter.tag.list();
  }

  // Retrieve one or more categories
  Future _getCategories() {
    return butter.category.list();
  }
}
