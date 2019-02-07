import 'package:flutter/material.dart';

class RemotePage extends StatefulWidget {
  @override
  RemotePageState createState() {
    return new RemotePageState();
  }
}

class RemotePageState extends State<RemotePage> {
  @override
  Widget build(BuildContext context) {
    double _value = 50.0;
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              color: Colors.indigoAccent,
              height: screenSize.height * 0.6,
              width: screenSize.width,
              alignment: Alignment.center,
              child: Icon(Icons.music_video,color: Colors.indigoAccent[700],size: 160.0,),
            ),
            onTap: () {},
            enableFeedback: true,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    splashColor: Colors.indigoAccent,
                    highlightElevation: 0.0,
                    elevation: 0.0,
                    child: Icon(Icons.skip_previous,color: Colors.indigoAccent,size: 60.0,),
                    shape: CircleBorder(),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.indigoAccent,
                    splashColor: Colors.indigoAccent[700],
                    child: Icon(Icons.play_arrow,color: Colors.white,size: 80.0,),
                    shape: CircleBorder(),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    splashColor: Colors.indigoAccent,
                    elevation: 0.0,
                    highlightElevation: 0.0,
                    child: Icon(Icons.skip_next,color: Colors.indigoAccent,size: 60.0,),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height*0.07,
            color: Colors.indigoAccent,
            alignment: Alignment.center,
            child: Text("Back to Browsing",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
          )
        ],
      ),
    );
  }
}
