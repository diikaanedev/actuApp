import 'package:actu221/configs/colors_by_dii.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MenuBotton extends StatelessWidget {
  final int index ;
  const MenuBotton({ Key? key, required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConvexAppBar(
    backgroundColor: rouge,
    height: MediaQuery.of(context).size.height * .07,
    color: blanc,
    // ignore: prefer_const_literals_to_create_immutables
    items: [
      const TabItem(icon: Icons.map,title: 'Pays',),
      const TabItem(icon: Icons.category, title: 'Catégorie'),
      const TabItem(icon: Icons.home, title: 'a221'),
      const TabItem(icon: Icons.video_call, title: 'Direct'),
      const TabItem(icon: Icons.favorite_border_rounded, title: 'Favorie', ),
    ],
    initialActiveIndex: index,//optional, default as 0
    onTap: (int i) async {
      switch (i) {
        case 0 :
          print("pays blocked");
          break;
          case 1 :
          print("Go Categorie");
          Navigator.popAndPushNamed(context, "/categorie");
          break;
          case 2 :
          print("Go Home");
          Navigator.popAndPushNamed(context, "/");

          break;
          case 3 :
          print("Go Direct");
          Navigator.popAndPushNamed(context, "/direct-a221");
          break;
           case 4 :
          print("Go Favorie");
          break;
        default:
      }
    },
  ),
    );
  }
}