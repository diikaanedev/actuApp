
// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:actu221/configs/colors_by_dii.dart';
import 'package:actu221/configs/get_data_by_dii.dart';
import 'package:actu221/models/article_models.dart';
import 'package:actu221/models/categorie_models.dart';
import 'package:actu221/widgets/home_categorie_widget.dart';
import 'package:actu221/widgets/menu_botton.dart';
import 'package:actu221/widgets/top_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

late _HomeScreenState homeScreenState ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _HomeScreenState createState() {
    homeScreenState =  _HomeScreenState();
    return homeScreenState;
  }
}

class _HomeScreenState extends State<HomeScreen>  {
  late Size size ;

  List<ArticleModel> liste = [];
  List<CategorieModel> listeCategorie = [];
  
  bool chargementOver = false ; 
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {

    getDataByDii(url: "taxonomy_term/rubrique?page[limit]=100").then((value) {
      //print(value['data']);

       setState(() {

          listeCategorie = CategorieModel.fromJson(listeCategorie: value['data']);
          

        }); 

      
    });

    getDataByDii(url: "node/article?page[limit]=100&sort=-changed").then((article) {
     //print(value['data']);
      setState(() {

          liste = ArticleModel.fromJson(listeArticle: article['data']);
          //print(liste.length);
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
                         Text('à la une'.toUpperCase(), style: const TextStyle(
                          color: rouge,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        const Spacer(),
                        Container(
                          width: size.width * .16,
                          height: size.height * .04,
                          // ignore: prefer_const_constructors
                          child: Center(
                            // ignore: prefer_const_constructors
                            child: Text('Voir +' , style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: blanc
                            ),),
                          ),
                          decoration: const BoxDecoration(
                            color: rouge,
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                        ),
                       
                        const SizedBox(width: 16,),

                      ],
                    ),
                  ),
            const SizedBox(height: 8,),
            SizedBox(
                    height: size.height * .4,
                    width: size.width,
                    child: TopHomeWidget(
                      articleModel: liste.first,
                    )
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
                          child: CategorieHomeWidget(articleModel: liste[1],)),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .48,
                          child:  CategorieHomeWidget(articleModel: liste[2],)),
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
                          child:  CategorieHomeWidget(articleModel: liste[3],)),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .48,
                          child:  CategorieHomeWidget(articleModel: liste[4],)),
                        const Spacer(),

                    ],)
                  ),
                ],
              ),
            ),
             // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                         Text('politique'.toUpperCase(), style: const TextStyle(
                          color: rouge,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        const Spacer(),
                        Container(
                          width: size.width * .16,
                          height: size.height * .04,
                          // ignore: prefer_const_constructors
                          child: Center(
                            // ignore: prefer_const_constructors
                            child: Text('Voir +' , style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: blanc
                            ),),
                          ),
                          decoration: const BoxDecoration(
                            color: rouge,
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                        ),
                       
                        const SizedBox(width: 16,),
                      ],
                    ),
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
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[1],)),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[2],)),
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
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[1],)),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[2],)),
                        const Spacer(),

                    ],)
                  ),
                ],
              ),
            ),
             // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                         Text('économie'.toUpperCase(), style: const TextStyle(
                          color: rouge,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        const Spacer(),
                        Container(
                          width: size.width * .16,
                          height: size.height * .04,
                          // ignore: prefer_const_constructors
                          child: Center(
                            // ignore: prefer_const_constructors
                            child: Text('Voir +' , style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: blanc
                            ),),
                          ),
                          decoration: const BoxDecoration(
                            color: rouge,
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                        ),
                       
                        const SizedBox(width: 16,),
                      ],
                    ),
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
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[1],)),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[2],)),
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
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[1],)),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: size.height * .25 ,
                    width: size.width * .45,
                          child:  CategorieHomeWidget(articleModel: liste[2],)),
                        const Spacer(),

                    ],)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     bottomNavigationBar: const MenuBotton(
       index: 2,
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