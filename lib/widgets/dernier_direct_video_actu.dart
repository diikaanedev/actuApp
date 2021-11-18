// ignore_for_file: unnecessary_const, avoid_unnecessary_containers

import 'package:actu221/configs/colors_by_dii.dart';
import 'package:flutter/material.dart';

class CategorieDirectWidget extends StatefulWidget {
  const CategorieDirectWidget({ Key? key }) : super(key: key);

  @override
  _CategorieDirectWidgetState createState() => _CategorieDirectWidgetState();
}

class _CategorieDirectWidgetState extends State<CategorieDirectWidget> {
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
                height: constraints.maxHeight * .6 ,
                  width: constraints.maxWidth ,
                 // ignore: prefer_const_constructors
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)
                    ),
                    image: const DecorationImage(
                      image: NetworkImage("https://www.francetvinfo.fr/pictures/Se2afzGe9seWh9xheYjo-F51Glo/51x0:1228x662/944x531/filters:format(webp)/2020/06/25/phpIiZcPV.jpg"),
                      fit: BoxFit.cover
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
                bottom: 0,
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
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: constraints.maxWidth * .9,
                      child:  Text('Man notified the police that his cocaine was stolen. Ends up being prosecuted.' ,  textAlign: TextAlign.justify,  style: TextStyle(
                    fontSize: constraints.maxHeight * .07,
                    color: noir
                  ),),
                    ),
                    Spacer(),

                  ],
                )

              )),
          

            ],
          ),
        ),
      );
    },
    );
  }
}