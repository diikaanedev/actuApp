// ignore_for_file: unnecessary_const, avoid_unnecessary_containers

import 'dart:convert';

import 'package:actu221/configs/colors_by_dii.dart';
import 'package:actu221/models/article_models.dart';
import 'package:actu221/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategorieHomeWidget extends StatefulWidget {
  final ArticleModel articleModel;
  const CategorieHomeWidget({ Key? key, required this.articleModel }) : super(key: key);

  @override
  _CategorieHomeWidgetState createState() => _CategorieHomeWidgetState();
}

class _CategorieHomeWidgetState extends State<CategorieHomeWidget> {
    String urlPhoto = "https://www.francetvinfo.fr/pictures/Se2afzGe9seWh9xheYjo-F51Glo/51x0:1228x662/944x531/filters:format(webp)/2020/06/25/phpIiZcPV.jpg" ;
    String categorie = "" ;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       for (var item in homeScreenState.listeCategorie) {
      if (item.id == widget.articleModel.categorie) {
        setState(() {
          categorie = item.title;
        });
      }
    }
    getUrl();
  }

  getUrl() async {
    // ignore: avoid_print
    print(widget.articleModel.urlPhoto);
    
    http.get(Uri.parse("https://a221.net/jsonapi/media/image_media/${widget.articleModel.urlPhoto}/field_media_image")).then((value) {
      var data  = json.decode(value.body);
      // ignore: avoid_print
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
      return Card(
        elevation: .5,
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
              ),
              Positioned(child: Container(
                height: constraints.maxHeight * .5 ,
                  width: constraints.maxWidth ,
                 // ignore: prefer_const_constructors
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)
                    ),
                    image:  DecorationImage(
                      image: NetworkImage(urlPhoto),
                      fit: BoxFit.fill
                    ),
                  ),
              )),
              Positioned(
                // ignore: avoid_unnecessary_containers
                right: constraints.maxWidth * .02,
                top: constraints.maxHeight * .02,
                child:  Container(
                child: const Icon(Icons.favorite_border_rounded , color: rouge, size: 20,),
              )),
              
              Positioned(
                bottom: constraints.maxHeight * .01,
                child: Container(
                height: constraints.maxHeight * .4,
                width: constraints.maxWidth,
                  // ignore: prefer_const_constructors
                decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    ),
                   color: blanc
                  ),
                // ignore: prefer_const_constructors
                child: Center(
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding:   EdgeInsets.only(left : constraints.maxHeight * .03 , right: constraints.maxHeight * .07),
                    child:  Text('Man notified the police that his cocaine was stolen. Ends up being prosecuted.' , textAlign: TextAlign.justify,  style: TextStyle(
                      fontSize: constraints.maxHeight * .05,
                      color: noir
                    ),),
                  ),
                ),

              )),
              Positioned(
                left: constraints.maxWidth * .01,
                bottom: constraints.maxHeight * .34,
                child: Container(
                  height: constraints.maxHeight * .1,
                  //width: constraints.maxWidth *.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                child: Center(child:  Text('  $categorie  ', style: TextStyle(
                  fontSize:  constraints.maxHeight * .05,
                  color: rouge,
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