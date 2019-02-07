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
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              color: Colors.indigoAccent,
              height: screenSize.height * 0.6,
              width: screenSize.width,
              alignment: Alignment.center,
              child: Text("This is where the thumbnail stuff goes"),
            ),
            onTap: () {},
            enableFeedback: true,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
        ],
      ),
    );
  }
}
