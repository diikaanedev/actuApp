import 'package:actu221/configs/colors_by_dii.dart';
import 'package:actu221/models/categorie_models.dart';
import 'package:actu221/screen/categorie_screen.dart';
import 'package:actu221/screen/home_screen.dart';
import 'package:flutter/material.dart';

class CategorieMenuTopWidget extends StatefulWidget {
  final CategorieModel categorieModel ;
  const CategorieMenuTopWidget({ Key? key, required this.categorieModel,  }) : super(key: key);

  @override
  _CategorieMenuTopWidgetState createState() => _CategorieMenuTopWidgetState();
}

class _CategorieMenuTopWidgetState extends State<CategorieMenuTopWidget> {
  late Size size ;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => homeScreenState.setState(() {
          categorieScreenState.categorieModelSelected = widget.categorieModel;
      }),
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) { return 
      
        Container(
          // ignore: prefer_const_constructors
          child: Center(
            child: Text(widget.categorieModel.title, style: TextStyle(
              fontSize: constraints.maxHeight * .3,
              color: noir,
              fontWeight: widget.categorieModel.id == categorieScreenState.categorieModelSelected.id ? FontWeight.bold : FontWeight.w300
            ),),
          ),
        // ignore: prefer_const_constructors
        decoration:  widget.categorieModel.id == categorieScreenState.categorieModelSelected.id ?  BoxDecoration(
          border: const Border (
            bottom: BorderSide(
              color: noir,
              width: 2
            )
          )
        ) : const BoxDecoration(),
      ); },
        
    
      ),
    );
  }
}