import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BrowserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Browse",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/remote_page");
            },
            icon: Icon(Icons.play_circle_outline),
          )
        ],
      ),
      body: VideoList(),
    );
  }
}

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {



  List<String> titles = ['Howdy Demo', 'Song Video', 'Another Video'];
  String subtitle = "Howdy Buddy";

  static String firstVideoUrl = "https://firebasestorage.googleapis.com/v0/b/duplex-84193.appspot.com/o/howdy_demo.mp4?alt=media&token=7365edda-1b6a-42bc-aaef-676c80cdcd30";
  static String secondVideoUrl = "https://firebasestorage.googleapis.com/v0/b/duplex-84193.appspot.com/o/testing_video_flutter.mp4?alt=media&token=37801d74-9700-4ca9-8a59-3099bd5151b3";
  static String thirdVideoUrl = "https://firebasestorage.googleapis.com/v0/b/duplex-84193.appspot.com/o/testing_video_flutter.mp4?alt=media&token=37801d74-9700-4ca9-8a59-3099bd5151b3";
  List<String> videoUrls = [firstVideoUrl, secondVideoUrl, thirdVideoUrl];


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return videoListItem(titles[index], subtitle, videoUrls[index]);
      },
      itemCount: titles.length,

    );
  }

  Widget videoListItem(String title, String subtitle, String videoUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: (){
          Firestore.instance.collection('controls').document('document_id').setData({
            "video_url": videoUrl,
            "play": true
          });
          Navigator.of(context).pushNamed("/remote_page");
        },
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(Icons.music_video),
      ),
    );
  }
}
