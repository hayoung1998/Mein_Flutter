import 'package:flutter/material.dart';
import 'package:mein/cart.dart';
import 'package:mein/main_page.dart';
import 'package:mein/menuAR.dart';
import 'package:mein/menudetail.dart';
import 'package:mein/restaurantDetail.dart';
import 'package:mein/menuList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/menudetail': (context) => MenuDetail(),
        '/menuAR': (context) => MenuAR(),
        '/cart': (context) => Cart(),
        '/restaurantdetail': (context) => RestaurantDetail(),
        '/menulist': (context) => MenuList()
      },
    );
  }
}
