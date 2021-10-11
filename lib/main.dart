import 'package:flutter/material.dart';
import 'package:flutterassignment/Screens/home_screen.dart';
import 'package:flutterassignment/Screens/profile.dart';
import 'package:flutterassignment/Screens/room_screen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAVAN 21RDFPP',
      theme: ThemeData.dark(),
      initialRoute: HomePage.name,
      routes: {
        HomePage.name:(context)=>HomePage(),
        RoomScreeen.name: (context)=>RoomScreeen(),
        Profile.name:(context)=>Profile(),
      },
    );
  }
}


