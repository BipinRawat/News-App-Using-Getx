import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_api/controller/news_controller.dart';

class NewsView extends StatefulWidget {

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  NewsController n = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('News GetX'),
      ),
      body: Stack(
          fit: StackFit.expand,
   children : [Catback(),
     Obx(()=>n.isLoading.value ?
         Center(child: Lottie.asset('assets/9329-loading.json'))
      : Container(
        child: ListView.builder(itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black,width: 5)),
                    height: 200,
                    width:  double.infinity,
                    child: FadeInImage(
                        image: n.newsList[index].urlToImage != null ? NetworkImage(n.newsList[index].urlToImage,
                    ): AssetImage("assets/breaking.png"),
                placeholder: AssetImage("assets/breaking.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  // Divider(
                  //   height: 10,
                  //   thickness: 3,
                  //   color: Colors.black,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(n.newsList[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),),
                  ),
                  Divider(
                    height: 10,
                    thickness: 3,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(n.newsList[index].description,
                    style: TextStyle(
                      fontSize: 18
                    ),),
                  )
                ],
              ),
            ),
          );
        }),
      )
    )
    ])
    );
  }
}
class Catback extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/newsback.png",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.2),
      colorBlendMode: BlendMode.darken,
    );
  }
}