import 'package:flutter/material.dart';

void main ()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Duplex",
      home: MyHomePage(),
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
            IconButton(icon: Icon(Icons.airplay,size: 40.0,), onPressed: () {}),
            IconButton(icon: Icon(Icons.live_tv,size: 40.0,), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
