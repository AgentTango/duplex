import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_core/firebase_core.dart';
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
  VideoPlayerController _videoPlayerController2;
  ChewieController videoController;

  // materialProgressColors: ChewieProgressColors(
  //   playedColor: Colors.red,
  //   handleColor: Colors.blue,
  //   backgroundColor: Colors.grey,
  //   bufferedColor: Colors.lightGreen,
  // ),
  // placeholder: Container(
  //   color: Colors.grey,
  // ),
  // autoInitialize: true,

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4');
    videoController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:
      showControls: true,
      fullScreenByDefault: true,

    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
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
//            FlatButton(
//              onPressed: () {
//                videoController.enterFullScreen();
//              },
//              child: Text('Fullscreen'),
//            ),
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        videoController.dispose();
//                        _videoPlayerController2.pause();
//                        _videoPlayerController2.seekTo(Duration(seconds: 0));
//                        videoController = ChewieController(
//                          videoPlayerController: _videoPlayerController1,
//                          aspectRatio: 3 / 2,
//                          autoPlay: true,
//                          looping: true,
//                          fullScreenByDefault: true
//                        );
//                      });
//                    },
//                    child: Padding(
//                      child: Text("Video 1"),
//                      padding: EdgeInsets.symmetric(vertical: 16.0),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        videoController.dispose();
//                        _videoPlayerController1.pause();
//                        _videoPlayerController1.seekTo(Duration(seconds: 0));
//                        videoController = ChewieController(
//                          videoPlayerController: _videoPlayerController2,
//                          aspectRatio: 3 / 2,
//                          autoPlay: true,
//                          looping: true,
//                        );
//                      });
//                    },
//                    child: Padding(
//                      padding: EdgeInsets.symmetric(vertical: 16.0),
//                      child: Text("Video 2"),
//                    ),
//                  ),
//                )
//              ],
//            ),
          ],
        ),
      ),
    );
  }
}
