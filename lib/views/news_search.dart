import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/views/news_view.dart';

class NewsSearch extends StatefulWidget {
  String category;
  NewsSearch({this.category});

  @override
  _NewsSearchState createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: AppBar(
        title: Text("News GetX"),
      ),
  body: SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          Image.asset('assets/news.png'),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search Articles",
                  border: InputBorder.none),
              onChanged: (newValue){
                setState(() {
                  widget.category = newValue;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Get.to(NewsView(),arguments: widget.category);
            },
            child: Text("Search   \u{1F50D}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
            // Icon(Icons.search),
          )
        ],
      ),
    ),
  ),        
    );
  }
}
