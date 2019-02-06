import 'package:flutter/material.dart';

class RemotePage extends StatefulWidget {
  @override
  RemotePageState createState() {
    return new RemotePageState();
  }
}

class RemotePageState extends State<RemotePage> {
  String status = "";
  Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                "$status",
                style: TextStyle(color: statusColor, fontSize: 32.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      status = "Playing";
                      statusColor = Colors.blue;
                    });
                  },
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.indigo,
                    size: 48.0,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      status = "Paused";
                      statusColor = Colors.black;
                    });
                  },
                  child: Icon(
                    Icons.pause,
                    size: 48.0,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      status = "Stopped";
                      statusColor = Colors.red;
                    });
                  },
                  child: Icon(
                    Icons.stop,
                    color: Colors.red,
                    size: 48.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
