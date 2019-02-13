import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoPage extends StatefulWidget {
  VideoPage({this.title = 'Duplex App'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _VideoPageState();
  }
}

class _VideoPageState extends State<VideoPage> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  ChewieController videoController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
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
