import 'package:flutter/material.dart';
import 'package:memesmania/Controller/FetchMeme.dart';
import 'package:memesmania/Controller/SaveData.dart';


// import '../Controller/FetchMeme.dart';
class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String imgUri = "";
  int? memeNo;
  bool isLoad = true;
  int targetMeme = 100;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitMemeNo();
    updateImg();
  }

  getInitMemeNo() async {
    memeNo = await SaveData.fetchData() ?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }else if(memeNo!>500){
      targetMeme = 1000;

    }
    setState(() {

    });
  }


  void updateImg() async {
    String getImgUri = await FetchMeme.fetchNewMeme();
    setState(() {
      imgUri = getImgUri;
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Meme #${memeNo.toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text("Target #${targetMeme.toString()}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            isLoad?
                Container(
                  height:300,
                  width: MediaQuery.of(context).size.width,
                  child : Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator()),
                  )
                )
                :
            Image.network(imgUri,
            height:300,
            width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () async {
              await SaveData.saveData(memeNo!+1);
              getInitMemeNo();
              updateImg();
            }, child: Text("Next Meme"),
            ),
            SizedBox(height: 50,),
            Text("Developer",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text("VenusLab",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)


          ],

        ),
      ),
    );
  }
}

