import 'package:flutter/material.dart';

class RemotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Colors.greenAccent,
                  size: 64.0,
                ),
                onPressed: (){
                  // TODO
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  Icons.pause_circle_outline,
                  color: Colors.red,
                  size: 64.0,
                ),
                onPressed: (){
                  // TODO
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
