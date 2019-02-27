import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class VideoPage extends StatefulWidget {
  VideoPage({this.title = 'Duplex App'});
  final String title;
  final String videoUrl = "https://firebasestorage.googleapis.com/v0/b/duplex-84193.appspot.com/o/howdy_demo.mp4?alt=media&token=7365edda-1b6a-42bc-aaef-676c80cdcd30";

  @override
  State<StatefulWidget> createState() {
    return _VideoPageState();
  }


}

class _VideoPageState extends State<VideoPage> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  ChewieController videoController;
  // String videoUrl = 'https://firebasestorage.googleapis.com/v0/b/duplex-84193.appspot.com/o/testing_video_flutter.mp4?alt=media&token=37801d74-9700-4ca9-8a59-3099bd5151b3';

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(widget.videoUrl);
    videoController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      // Try playing around with some of these other options:
      showControls: false,
      fullScreenByDefault: true,
      looping: true,
    );

    CollectionReference reference = Firestore.instance.collection('controls');
    reference.snapshots().listen((querySnapshots) {
      querySnapshots.documentChanges.forEach((changes) {
        var playingState = changes.document.data['play'];
        print(playingState);
        if (playingState)
          videoController.play();
        else
          videoController.pause();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Chewie(
                  controller: videoController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
