import 'package:calix/src/pages/detalles_page.dart';
import 'package:calix/src/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breaking Bad Page',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(_)=>HomePage(),
        '/detalles': (_)=>DetalleBreakingBadPage()
      },
    );
    
  }
}