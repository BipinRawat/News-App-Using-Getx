import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:news_api/views/news_search.dart';
import 'package:news_api/views/news_view.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsSearch(),
    );
  }
}
