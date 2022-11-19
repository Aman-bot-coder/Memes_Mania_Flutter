import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("lib/img/applogo.png"),
          SizedBox(height: 5,),
          Text("Memes Maina",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text("VenusTechSoft",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold ),)
        ],
      )),
    );
  }
}
