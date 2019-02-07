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
    double _value = 25.0;
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              color: Colors.pinkAccent,
              height: screenSize.height * 0.6,
              width: screenSize.width,
              alignment: Alignment.center,
              child: Text("This is where the thumbnail stuff goes"),
            ),
            onTap: () {},
            enableFeedback: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 50.0),
            child: Container(
              child: Slider(
                value: _value,
                min: 0.0,
                max: 100.0,
                activeColor: Colors.pinkAccent,
                onChanged: (double value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.white,
                  elevation: 0.0,
                  child: Icon(Icons.skip_previous,color: Colors.pinkAccent,size: 100.0,),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.pinkAccent,
                  child: Icon(Icons.play_arrow,color: Colors.white,size: 100.0,),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.white,
                  elevation: 0.0,
                  child: Icon(Icons.skip_next,color: Colors.pinkAccent,size: 100.0,),
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
