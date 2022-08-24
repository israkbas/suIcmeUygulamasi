import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person),color:Colors.black,iconSize: 35,),
          ],
        ),
        body: SafeArea(
          child:WaterPage(),
        ),
      ),
    );
  }
}

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  int bardakSayisi=0;
  int waterImage=0;


 void BardakArtirma() {
   setState(() {
     bardakSayisi++;
     waterImage++;
   });
 }
  void fotoArtirma() {
    setState((){
      waterImage++;
    });
}
void BardakAzaltma() {
  setState((){
    bardakSayisi--;

  });
}
  void fotoAzaltma() {
    setState(() {
      waterImage--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        children: [
        Expanded(
      child: Image.asset("images/$waterImage.png"),
),
    Container(padding: EdgeInsets.only(top:7),
    child: Text(
    "Bugün kaç bardak su içtin ?",
    style: TextStyle(
    letterSpacing: 3,
    fontSize: 22.0,
    fontFamily: "Oleo Script Swash Caps",
    color: Colors.black,
    ),
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    IconButton(padding: EdgeInsets.only(bottom:10,top:7),
    iconSize: 35,
    onPressed: () {
    {
      if(bardakSayisi>0){
        BardakAzaltma();
      }

      if(bardakSayisi>0 && bardakSayisi<5)
      {
        fotoAzaltma();
      }
      if(bardakSayisi==0){
        waterImage=0;
      }


    }
    },
    icon: Icon(
    Icons.remove_circle_outline,
    ),
    ),
    Text(
    '$bardakSayisi',
    style: TextStyle(fontSize: 25),
    ),
    IconButton(
        padding: EdgeInsets.only(bottom:10,top:7),
    iconSize: 35,
    onPressed: () {
    {
      BardakArtirma();

      if (bardakSayisi==6)
      {
        waterImage=6;
      }

      if(bardakSayisi>6)
      {
      waterImage=5;
      }
    }
    },
    icon: Icon(Icons.add_circle_outline)),
    ],
    ),
    ],
    ),
    );
  }
}
