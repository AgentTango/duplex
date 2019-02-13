  import 'package:flutter/material.dart';
import 'package:duplex/pages/video_page.dart';
import 'package:duplex/pages/remote_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Duplex",
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/video_page': (BuildContext context) => VideoPage(),
        '/remote_page': (BuildContext context) => RemoteControlPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/remote_page");
              },
              child: Icon(
                Icons.airplay,
                size: 40.0,
                color: Colors.blueAccent,
              ),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/video_page");
              },
              child: Icon(
                Icons.live_tv,
                size: 40.0,
                color: Colors.red,
              ),
              shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
            ),
          ],
        ),
      ),
    );
  }
}
