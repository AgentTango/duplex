import 'package:flutter/material.dart';

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

  List<String> titles = ['My Hero', 'Arrows', 'I\'ll Stick Around'];
  String subtitle = "Howdy Buddy";

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return videoListItem(titles[index], subtitle);
      },
      itemCount: titles.length,

    );
  }

  Widget videoListItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: (){
          Navigator.of(context).pushNamed("/video_page");
        },
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(Icons.music_video),
      ),
    );
  }
}
