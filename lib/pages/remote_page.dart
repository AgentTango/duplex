import 'package:flutter/material.dart';

class RemotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.play_circle_outline,
              color: Colors.greenAccent,
            ),
            Icon(
              Icons.pause_circle_outline,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
