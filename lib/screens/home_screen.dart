import 'package:flutter/material.dart';
import '../homescreen_wedgets/article.dart';
import '../homescreen_wedgets/banner.dart';
import '../homescreen_wedgets/library.dart';
import '../homescreen_wedgets/magzines.dart';
import '../homescreen_wedgets/music.dart';
import '../homescreen_wedgets/youtube.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BTM'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return BannerWidget();
            case 1:
              return Music();
            case 2:
              return Magzine();
            case 3:
              return Youtube();
            default:
              return SizedBox.shrink();
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.music_video_rounded),
              title: Text('Audio Message'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: Icon(Icons.music_note_sharp),
              title: Text('Music'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: Icon(Icons.article_sharp),
              title: Text('Article'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              leading: Icon(Icons.ondemand_video),
              title: Text('Videos'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('Messages'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              leading: Icon(Icons.margin_outlined),
              title: Text('Magazines'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Profile'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
