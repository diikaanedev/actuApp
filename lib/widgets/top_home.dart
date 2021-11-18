// ignore_for_file: unnecessary_const, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:actu221/configs/colors_by_dii.dart';
import 'package:actu221/models/article_models.dart';
import 'package:actu221/screen/home_screen.dart';
import 'package:actu221/screen/read_article_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class TopHomeWidget extends StatefulWidget {

  final ArticleModel articleModel;
  const TopHomeWidget({ Key? key  ,  required  this.articleModel}) : super(key: key);

  @override
  _TopHomeWidgetState createState() => _TopHomeWidgetState();
}

class _TopHomeWidgetState extends State<TopHomeWidget> {

  String urlPhoto = "https://www.francetvinfo.fr/pictures/Se2afzGe9seWh9xheYjo-F51Glo/51x0:1228x662/944x531/filters:format(webp)/2020/06/25/phpIiZcPV.jpg" ;
  String categorie = "" ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var item in homeScreenState.listeCategorie) {
      if (item.id == widget.articleModel.categorie) {
        print(item.id);
        setState(() {
          categorie = item.title;
        });
      }
    }
    getUrl();
  }

  getUrl() async {

    http.get(Uri.parse("https://a221.net/jsonapi/media/image_media/${widget.articleModel.urlPhoto}/field_media_image")).then((value) {
      var data  = json.decode(value.body);
      setState(() {
        urlPhoto = "https://a221.net"+data['data']['attributes']['uri']['url'];
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {  
      // ignore: sized_box_for_whitespace
      return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReadArticleScreen(articleModel: widget.articleModel,))),
        child: Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Stack(
            children: [
              Container(
                  height: constraints.maxHeight ,
                  width: constraints.maxWidth ,
                  // ignore: prefer_const_constructors
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    image:  DecorationImage(
                      image: NetworkImage(urlPhoto),
                      fit: BoxFit.fill
                    ),
                  ),
              ),
              Positioned(
                // ignore: avoid_unnecessary_containers
                right: constraints.maxWidth * .02,
                top: constraints.maxHeight * .02,
                child:  Container(
                child:  Icon(Icons.favorite_border_rounded , color: rouge, size: constraints.maxHeight * .05,),
              )),
              
              Positioned(
                bottom: constraints.maxHeight * .0,
                child: Container(
                height: constraints.maxHeight * .2,
                width: constraints.maxWidth,
                  // ignore: prefer_const_constructors
                decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2)
                    ),
                   color: noir
                  ),
                // ignore: prefer_const_constructors
                child: Center(
                  // ignore: unnecessary_string_interpolations
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: 10,
                      right: 10
                    ),
                    child: Text('${widget.articleModel.title}' , textAlign: TextAlign.justify,  style: TextStyle(
                      fontSize: constraints.maxHeight * .035,
                      color: blanc
                    ),),
                  ),
                ),
      
              )),
              Positioned(
                left: constraints.maxWidth * .02,
                bottom: constraints.maxHeight * .19,
                child: Container(
                  height: constraints.maxHeight * .07,
                  //width: constraints.maxWidth *.3,
                  decoration: const BoxDecoration(
                    color: rouge,
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                child: Center(child:  Text('  $categorie  ', style: TextStyle(
                  fontSize:  constraints.maxHeight * .04,
                  color: blanc,
                  fontWeight: FontWeight.bold
                ),)),
              )),
      
            ],
          ),
        ),
      );
    },
    );
  }
}