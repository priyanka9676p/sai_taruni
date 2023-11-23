import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import '../screens/playmusic.dart';

class MusicListScreen extends StatefulWidget {
  const MusicListScreen({Key? key}) : super(key: key);

  @override
  State<MusicListScreen> createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  List<Map<String, dynamic>> musicList = [];
  List<bool> isPlayingList = [];
  int? currentlyPlayingIndex;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _fetchMusicData();
  }

  Future<void> _fetchMusicData() async {
    final response = await http.get(
      Uri.parse('http://ec2-15-207-196-141.ap-south-1.compute.amazonaws.com:8080/v1/audio/getall'),
    );

    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);

      if (jsonData is Map && jsonData.containsKey('getallsongs')) {
        final dynamic songsData = jsonData['getallsongs'];

        if (songsData is List) {
          setState(() {
            musicList = List<Map<String, dynamic>>.from(songsData);
            isPlayingList = List<bool>.filled(musicList.length, false);
          });
        } else {
          // Handle error - 'getallsongs' property is not a List
          print('Invalid data format. Expected a List in "getallsongs", but received: $songsData');
        }
      } else {
        // Handle error - 'getallsongs' property is not found
        print('Invalid data format. "getallsongs" property not found in the response.');
      }
    } else {
      // Handle error
      print('Failed to load music data. Error ${response.statusCode}');
    }
  }

  void _playAudio(String audioUrl, int index) {
    if (currentlyPlayingIndex != null) {
      // Pause the previously playing audio
      if (currentlyPlayingIndex != index) {
        audioPlayer.pause();
        setState(() {
          isPlayingList[currentlyPlayingIndex!] = false;
        });
      } else {
        // Toggle play/pause for the same audio
        if (isPlayingList[index]) {
          audioPlayer.pause();
        } else {
          audioPlayer.resume();
        }
        setState(() {
          isPlayingList[index] = !isPlayingList[index];
        });
        return;
      }
    }

    // Play the selected audio
    audioPlayer.play(audioUrl as Source);
    setState(() {
      isPlayingList[index] = true;
      currentlyPlayingIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: screenHeight * 0.1,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Music List',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (BuildContext context, int index) {
                final music = musicList[index];

                return GestureDetector(
                  onTap: () {
                    // Navigate to the AudioPlayerScreen when the container is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayer(),
                      ),
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.13,
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.04,
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.16,
                          height: screenWidth * 0.16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.1),
                          ),
                          child: Image.network(
                            music['Banner_location'] ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                music['Musictitle'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A315B),
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                              Text(
                                music['artist'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A315B),
                                  fontSize: screenWidth * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(isPlayingList[index] ? Icons.pause : Icons.play_arrow),
                          onPressed: () {
                            _playAudio(music['Audio_location'] ?? '', index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
