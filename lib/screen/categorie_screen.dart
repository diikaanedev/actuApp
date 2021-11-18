
import 'dart:convert';

import 'package:actu221/configs/colors_by_dii.dart';
import 'package:actu221/configs/get_data_by_dii.dart';
import 'package:actu221/models/article_models.dart';
import 'package:actu221/models/categorie_models.dart';
import 'package:actu221/screen/home_screen.dart';
import 'package:actu221/widgets/categorie_widget_menu_top.dart';
import 'package:actu221/widgets/home_categorie_widget.dart';
import 'package:actu221/widgets/menu_botton.dart';
import 'package:actu221/widgets/top_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

late _CategorieScreenState categorieScreenState;

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({ Key? key }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _CategorieScreenState createState() {
    categorieScreenState =  _CategorieScreenState();
    return categorieScreenState;
  }
}

class _CategorieScreenState extends State<CategorieScreen> {
  late Size size ;

  List<ArticleModel> liste = [];
  bool chargementOver = false ; 
  late CategorieModel categorieModelSelected ;
  @override
  void initState() {
    super.initState();
    setState(() {
      categorieModelSelected = homeScreenState.listeCategorie.first;
    });
    getData();
  }

  getData() async {

    getDataByDii(url: "node/article?page[limit]=100&sort=-changed").then((value) {
      setState(() {

          liste = ArticleModel.fromJson(listeArticle: value['data']);
         
          chargementOver = true ;

        }); 
    });
    
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
   
    return chargementOver ? Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        backgroundColor: blanc,
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              color: blanc,
              height: size.height,
              width: size.width,
            ),
           
            Positioned(
              top: size.height * .07,
              child: Container(
              height: size.height * .93,
              width: size.width,
              child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 8,),
                 SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                         Text('En ce moment'.toUpperCase(), style: const TextStyle(
                          color: rouge,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .4,
                  width: size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children:  [
                      SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                          child: CategorieHomeWidget(articleModel: liste[1]),
                        ),
                         SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieHomeWidget(articleModel: liste[2]),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieHomeWidget(articleModel: liste[1]),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieHomeWidget(articleModel: liste[2]),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieHomeWidget(articleModel: liste[1]),

                        ),

                      ],
                    ),
                  ),
                    SizedBox(height: 16,),
                 SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                         Text('Dans la même catégorie'.toUpperCase(), style: const TextStyle(
                          color: rouge,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),
                  ),
                 const SizedBox(height: 8,),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
             SizedBox(
                    height: size.height * .25 ,
                    width: size.width,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                     
                       // ignore: prefer_const_literals_to_create_immutables
                       children: [
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                           height: size.height * .25 ,
                    width: size.width * .48,
                          child:  CategorieHomeWidget(articleModel: liste[1],)),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .48,
                          child:  CategorieHomeWidget(articleModel: liste[2])),
                        const Spacer(),

                    ],)
                  ),
                    SizedBox(
                    height: size.height * .25 ,
                    width: size.width,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                     
                       // ignore: prefer_const_literals_to_create_immutables
                       children: [
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                           height: size.height * .25 ,
                    width: size.width * .48,
                          child: CategorieHomeWidget(articleModel: liste[1])),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .48,
                          child: CategorieHomeWidget(articleModel: liste[2])),
                        const Spacer(),

                    ],)
                  ),
                ],
              ),
            ),
          ],
        ),
            )),
             Positioned(child: Container(
              height: size.height * .07,
              width: size.width,
              child:  SizedBox(
                    height: size.height * .07,
                    width: size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:  homeScreenState.listeCategorie.map((e) => Container(
                             height: size.height * .05,
                             width: size.width * .3,
                            child: CategorieMenuTopWidget(
                             categorieModel: e,
                            )
                          ),
                      ).toList()
                    
                    ),
                  ),
            )),
          ],
        )
      ),
     bottomNavigationBar: const MenuBotton(
       index: 1,
     )
    ) : Scaffold(
       appBar: AppBar(
        toolbarHeight: .0,
        backgroundColor: blanc,
        elevation: 0,
      ),
     body : SizedBox(
        height: size.height,
        width: size.width,  
        // ignore: prefer_const_constructors
        child: Center(
          // ignore: prefer_const_constructors
          child: CircularProgressIndicator(

          ),
        ),  
      )
    );
  }
  
}