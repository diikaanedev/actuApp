import 'package:actu221/configs/colors_by_dii.dart';
import 'package:actu221/widgets/dernier_direct_video_actu.dart';
import 'package:actu221/widgets/home_categorie_widget.dart';
import 'package:actu221/widgets/menu_botton.dart';
import 'package:actu221/widgets/top_direct_video_actu.dart';
import 'package:actu221/widgets/top_home.dart';
import 'package:flutter/material.dart';

class DirectA221Screen extends StatefulWidget {
  const DirectA221Screen({ Key? key }) : super(key: key);

  @override
  _DirectA221ScreenState createState() => _DirectA221ScreenState();
}

class _DirectA221ScreenState extends State<DirectA221Screen> {
  late Size size ;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return  Scaffold(
     appBar:  AppBar(
       toolbarHeight: .0,
    elevation: .0,
    backgroundColor: blanc,
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
                        const Spacer(),

                         Text('Le Direct aCTU221'.toUpperCase(), style: const TextStyle(
                          color: rouge,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        const Spacer(),
                       
                       
                        const SizedBox(width: 16,),

                      ],
                    ),
                  ),
            const SizedBox(height: 8,),
            SizedBox(
                    height: size.height * .4,
                    width: size.width,
                    child: const TopDirectVideoWidget()
                  ),
            const SizedBox(height: 8,),
            SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                         Text('Dernières vidéos'.toUpperCase(), style: const TextStyle(
                          color: noir,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .3,
                  width: size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children:  [
                      SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                          child: CategorieDirectWidget(),
                        ),
                         SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),

                      ],
                    ),
                  ),
           SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                         Text('vidéos politique'.toUpperCase(), style: const TextStyle(
                          color: noir,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .3,
                  width: size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children:  [
                      SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                          child: CategorieDirectWidget(),
                        ),
                         SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),

                      ],
                    ),
                  ),

                   SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                         Text('vidéos économique'.toUpperCase(), style: const TextStyle(
                          color: noir,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .3,
                  width: size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children:  [
                      SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                          child: CategorieDirectWidget(),
                        ),
                         SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .3,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: size.height * .4,
                          width: size.width * .6,
                           child: CategorieDirectWidget(),

                        ),

                      ],
                    ),
                  ),
           
          ],
        ),
      ),
       bottomNavigationBar: MenuBotton(index: 3),
    );
  }
}