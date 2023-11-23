import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String musicTitle = '';
  String artist = '';
  String lyrics = '';
  String imageUrl = '';
  Map<String, dynamic> data = {};
  int currentSongIndex = 0;
  List<dynamic> apiResponse = [];
  ScrollController _scrollController = ScrollController();
  Timer? lyricsTimer;

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
        _scrollToCurrentPosition(newPosition);
      });
    });
    fetchData();
    startLyricsTimer();
  }

  void startLyricsTimer() {
    lyricsTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        // Reset the lyrics highlighting when the timer fires
        _scrollController.jumpTo(0);
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  Future fetchData() async {
    final apiUrl =
        'http://ec2-13-235-75-220.ap-south-1.compute.amazonaws.com:8080/v1/audio/audio-details';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        apiResponse = json.decode(response.body);

        if (apiResponse.isNotEmpty) {
          setState(() {
            data = {
              'Musictitle': apiResponse[0]['Musictitle'],
              'artist': apiResponse[0]['artist'],
              'lyrics': apiResponse[0]['lyrics'],
              'Audio_location': apiResponse[0]['Audio_location'],
              'Banner_location': apiResponse[0]['Banner_location'],
            };

            musicTitle = data['Musictitle'];
            artist = data['artist'];
            lyrics = data['lyrics'];
            imageUrl = data['Banner_location'];

            audioPlayer.setAudioContext(data['Audio_location']);
          });

          // Increment the index only if data is successfully fetched
          currentSongIndex++;
        } else {
          throw Exception('Data is empty.');
        }
      } else {
        throw Exception('Failed to load data. Error ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future playNextSong() async {
    currentSongIndex--; // Move to the next song in the list

    try {
      if (currentSongIndex < apiResponse.length) {
        await fetchData(); // Fetch data for the new song
        await audioPlayer.setAudioContext(data['Audio_location']); // Set the new song URL
        await audioPlayer.play(data['Audio_location']); // Play the new song
      } else {
        // If you reach the end of the song list, you can handle it accordingly
        // For example, you can stop playback or loop back to the first song
        currentSongIndex = 0;
        await fetchData(); // Fetch data for the first song
        await audioPlayer.setAudioContext(data['Audio_location']); // Set the first song URL
        await audioPlayer.play(data['Audio_location']); // Play the first song
      }
    } catch (error) {
      // Handle the error and show a message to the user
      print('Cannot play next song: $error');
      // You can also show a snackbar or an alert dialog to inform the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Music Player'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 250,
                height: 250,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    musicTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    artist,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final newPosition = Duration(seconds: value.toInt());
                await audioPlayer.seek(newPosition);
                await audioPlayer.resume();
              },
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.download_rounded),
                    onPressed: () {
                      // Implement shuffle action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_rewind),
                    onPressed: () {
                      // Implement rewind action
                    },
                  ),
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.play(data['Audio_location']);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward_sharp),
                    onPressed: () async {
                      await playNextSong();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () async {
                      // await downloadAudio();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              padding: EdgeInsets.all(16),
              height: 200,
              width: double.infinity,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    'Lyrics',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: _buildLyricsSpans(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _buildLyricsSpans() {
    List<TextSpan> spans = [];
    List<String> words = lyrics.split(' ');

    for (int i = 0; i < words.length; i++) {
      spans.add(
        TextSpan(
          text: words[i] + ' ',
          style: TextStyle(
            color: _shouldHighlight(i) ? Colors.white : Colors.black,
            // Add any other styles you want for the lyrics here
          ),
        ),
      );
    }

    return spans;
  }

  bool _shouldHighlight(int index) {
    int start = position.inSeconds - 5;
    int end = position.inSeconds + 5;

    return index * 5 >= start && index * 5 <= end;
  }

  void _scrollToCurrentPosition(Duration newPosition) {
    int scrollPosition = (newPosition.inSeconds ~/ 5) * 5;
    _scrollController.animateTo(
      scrollPosition.toDouble(),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  String formatTime(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
