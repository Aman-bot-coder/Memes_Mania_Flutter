import 'package:flutter/material.dart';
import 'package:memesmania/view/Home.dart';
import 'package:memesmania/view/SplashScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSplash = true;
  showSplashScreen(){
    Future.delayed(Duration(seconds:5),(){
      setState(() {
        showSplash = false;
      });
    });
  }
  @override
  void initState() {
    showSplashScreen();
    super.initState();
  }
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MemesMania',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showSplash?SplashScreen(): Home(),
    );
  }
}

