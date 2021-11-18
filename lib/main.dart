import 'package:actu221/screen/categorie_screen.dart';
import 'package:actu221/screen/direct_a221_screen.dart';
import 'package:actu221/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actu221',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ZenAntiqueSoft'
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const HomeScreen(),
        '/categorie': (context) => const CategorieScreen(),
        '/direct-a221': (context) => const DirectA221Screen(),
      },
    );
  }
}

