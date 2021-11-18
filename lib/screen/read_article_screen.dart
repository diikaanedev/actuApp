import 'dart:convert';

import 'package:actu221/configs/colors_by_dii.dart';
import 'package:actu221/models/article_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReadArticleScreen extends StatefulWidget {
  final ArticleModel articleModel;
  const ReadArticleScreen({ Key? key, required this.articleModel }) : super(key: key);

  @override
  _ReadArticleScreenState createState() => _ReadArticleScreenState();
}

class _ReadArticleScreenState extends State<ReadArticleScreen> {
  late Size size ;
   String urlPhoto = "https://www.francetvinfo.fr/pictures/Se2afzGe9seWh9xheYjo-F51Glo/51x0:1228x662/944x531/filters:format(webp)/2020/06/25/phpIiZcPV.jpg" ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUrl();
  }

  getUrl() async {
    // ignore: avoid_print
    print(widget.articleModel.urlPhoto);
    http.get(Uri.parse("https://a221.net/jsonapi/media/image_media/${widget.articleModel.urlPhoto}/field_media_image")).then((value) {
      var data  = json.decode(value.body);
      // ignore: avoid_print
      setState(() {
        urlPhoto = data['data']['attributes']['image_style_uri'][0]['750x750'];
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar :AppBar(
        toolbarHeight: .0,
        backgroundColor: blanc,
        elevation: 0,
      ),
      body:  ListView(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: size.height * 1.5,
              width: size.width,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                       // height: constraints.maxHeight,
                        //width: constraints.maxWidth,
                        //color: blanc
                      ),
                      Positioned(
                        child: Container(
                        height: constraints.maxHeight * .3,
                        width: constraints.maxWidth,
                       decoration: BoxDecoration(
                         image: DecorationImage(image: NetworkImage(urlPhoto), fit: BoxFit.fill)
                       ),
                      )),
                      Positioned(
                        top: constraints.maxHeight * .25,
                        left: constraints.maxWidth * .05,
                        child: Card(
                          child: Container(
                          height: constraints.maxHeight ,
                          width: constraints.maxWidth * .9,
                          color: rouge,
                        ),
                        ))
                    ],
                  );
                }
              ),
            ),
            const SizedBox(height: 8,)
          ],
        ),
      
    );
  }
}