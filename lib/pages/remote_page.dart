import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class RemoteControlPage extends StatefulWidget {
  @override
  _RemoteControlPageState createState() {
    return _RemoteControlPageState();
  }
}

class _RemoteControlPageState extends State<RemoteControlPage> {
  List<DocumentSnapshot> documents;

  bool _videoState = false;

  @override
  Widget build(BuildContext context) {
    double _value = 50.0;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              color: Colors.indigoAccent,
              height: screenSize.height * 0.6,
              width: screenSize.width,
              alignment: Alignment.center,
              child: Icon(
                Icons.music_video,
                color: Colors.indigoAccent[700],
                size: 160.0,
              ),
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
                    onPressed: () {
                      /// Play Button
                      Firestore.instance
                          .collection('controls')
                          .document('document_id')
                          .get()
                          .then((v) {
                        bool ip = v.data['play'];
                        _videoState = ip;
                        print(_videoState);
                        Firestore.instance
                            .collection('controls')
                            .document('document_id')
                            .updateData({'play': !ip});
                        setState(() {
                          _videoState = ip;
                        });
                      });
                    },
                    fillColor: Colors.indigoAccent,
                    splashColor: Colors.indigoAccent[700],
                    child: _videoState
                        ? Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 80.0,
                          )
                        : Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 80.0,
                          ),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.07,
            color: Colors.indigoAccent,
            alignment: Alignment.center,
            child: Text(
              "Back to Browsing",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
