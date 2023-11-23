// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
//
// class Api extends StatefulWidget {
//   const Api({Key? key}) : super(key: key);
//
//   @override
//   State<Api> createState() => _ApiState();
// }
//
// class _ApiState extends State<Api> {
//   final AudioPlayer audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // listen to states: playing, paused, stopped
//     audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
//       setState(() {
//         isPlaying = state == PlayerState.PLAYING;
//       });
//     });
//
//     // listen to audio duration
//     audioPlayer.onDurationChanged.listen((Duration newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });
//
//     // listen to audio position
//     audioPlayer.onAudioPositionChanged.listen((Duration newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.network(
//               "https://www.pexels.com/photo/photo-of-person-playing-acoustic-guitar-1751731/",
//               width: double.infinity,
//               height: 350,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text("Lover"),
//           SizedBox(height: 10),
//           Text("Taylor Swift"),
//           Slider(
//             min: 0,
//             max: duration.inSeconds.toDouble(),
//             value: position.inSeconds.toDouble(),
//             onChanged: (double value) async {
//               final Duration newPosition = Duration(seconds: value.toInt());
//               await audioPlayer.seek(newPosition);
//
//               // optional: play audio if paused
//               await audioPlayer.resume();
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 160),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(formatTime(position)),
//                 Text(formatTime(duration - position)),
//               ],
//             ),
//           ),
//           CircleAvatar(
//             radius: 35,
//             child: IconButton(
//               icon: Icon(
//                 isPlaying ? Icons.pause : Icons.play_arrow,
//               ),
//               iconSize: 50,
//               onPressed: () async {
//                 if (isPlaying) {
//                   await audioPlayer.pause();
//                 } else {
//                   String url = 'https://pagalworld.com.vc/lover-taylor-swift-mp3-song-download.html';
//                   int result = await audioPlayer.play(url);
//                   if (result == 1) {
//                     // success
//                   }
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   String formatTime(Duration duration) {
//     String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
//     String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
//
//
// class MusicPlayer extends StatefulWidget {
//   @override
//   _MusicPlayerState createState() => _MusicPlayerState();
// }
//
// class _MusicPlayerState extends State<MusicPlayer> {
//   final AudioPlayer audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//
//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Replace the 'YOUR_IMAGE_URL' with the actual image URL
//           Image.network(
//             'https://www.pexels.com/photo/photo-of-person-playing-acoustic-guitar-1751731/',
//             width: 200,
//             height: 200,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(height: 20),
//           IconButton(
//             iconSize: 64,
//             icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//             onPressed: () {
//               if (isPlaying) {
//                 audioPlayer.pause();
//               } else {
//                 // Replace 'YOUR_AUDIO_URL' with the actual audio URL
//                 String url = ' https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav';
//                 audioPlayer.play(url as Source);
//               }
//               setState(() {
//                 isPlaying = !isPlaying;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//

// import 'package:animatedcircleavthar/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// class MusicScreen extends StatefulWidget {
//   const MusicScreen({Key? key}) : super(key: key);
//
//   @override
//   _MusicScreenState createState() => _MusicScreenState();
// }
//
// class _MusicScreenState extends State<MusicScreen> {
//   AudioPlayer player = AudioPlayer();
//   Duration _position = Duration.zero;
//   Duration _duration = Duration.zero;
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen dimensions using MediaQuery
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//
//
//
//     List<String> lyrics = [
//       'i ve been tryna call',
//       'ive been on my own for long enough',
//       'Maybe you can show me how to love,',
//       'maybe Im goin through withdrawals',
//       'You dont even have to do too much',
//       'You can turn me on with just a touch, baby',
//     ];
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           SizedBox(height: screenHeight * 0.025),
//           Padding(
//             padding: EdgeInsets.only(top: screenHeight * 0.02),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(width: screenWidth * 0.026),
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_outlined),
//                   iconSize: screenHeight * 0.033,
//                   onPressed: () {
//                     // Add your logic for the back button onPressed
//                   },
//                 ),
//                 SizedBox(width: screenWidth * 0.12),
//                 Text(
//                   'Music Details',
//                   style: TextStyle(
//                     fontSize: screenHeight * 0.024,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.025),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: screenHeight * 0.23,
//                 width: screenWidth * 0.54,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.3),
//                   color: Colors.white,
//                 ),
//                 child: Image.asset(
//                   'assets/Rectangle 20.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: screenHeight * 0.025),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(width: screenWidth * 0.05),
//               Text(
//                 'Blinding Nights',
//                 style: TextStyle(
//                   fontSize: screenHeight * 0.023,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(width: screenWidth * 0.052),
//               InkWell(
//                 onTap: () {
//                   // Add your logic for View Lyrics onTap
//                   print('View Lyrics tapped!');
//                 },
//                 child: Text(
//                   'View Lyrics',
//                   style: TextStyle(
//                     fontSize: screenHeight * 0.017,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               Icon(Icons.arrow_forward, size: screenHeight * 0.04),
//             ],
//           ),
//           SizedBox(height: screenHeight * 0.025),
//           Container(
//             height: screenHeight * 0.04,
//             width: screenWidth - (screenWidth * 0.04),
//             child: Slider(
//               value: _position.inSeconds.toDouble(),
//               onChanged: (value) async {
//                 await player.seek(Duration(seconds: value.toInt()));
//                 setState(() {});
//               },
//               min: 0,
//               max: _duration.inSeconds.toDouble(),
//               inactiveColor: Colors.blue.shade900,
//               activeColor: Colors.blue.shade900,
//             ),
//           ),
//           Row(
//             children: [
//               SizedBox(width: screenWidth * 0.08),
//               Row(
//                 children: [
//                   Text(_duration.format()),
//                 ],
//               ),
//               SizedBox(width: screenWidth * 0.67),
//               Row(
//                 children: [
//                   Text(_duration.format()),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: screenHeight * 0.025),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.shuffle),
//                 iconSize: screenHeight * 0.04,
//                 onPressed: () {
//                   // Add your logic for shuffle onPressed
//                 },
//               ),
//               SizedBox(width: screenWidth * 0.04),
//               IconButton(
//                 icon: Icon(Icons.fast_rewind),
//                 iconSize: screenHeight * 0.04,
//                 onPressed: () {
//                   // Add your logic for rewind onPressed
//                 },
//               ),
//               SizedBox(width: screenWidth * 0.04),
//               IconButton(
//                 icon: Icon(Icons.pause),
//                 iconSize: screenHeight * 0.04,
//                 onPressed: () {
//                   // Add your logic for pause onPressed
//                 },
//               ),
//               SizedBox(width: screenWidth * 0.04),
//               IconButton(
//                 icon: Icon(Icons.fast_forward_sharp),
//                 iconSize: screenHeight * 0.04,
//                 onPressed: () {
//                   // Add your logic for fast forward onPressed
//                 },
//               ),
//               SizedBox(width: screenWidth * 0.04),
//               IconButton(
//                 icon: Icon(Icons.file_download),
//                 iconSize: screenHeight * 0.04,
//                 onPressed: () {
//                   // Add your logic for download onPressed
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: screenHeight * 0.055),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(width: screenWidth * 0.065),
//               Text(
//                 'Lyrics',
//                 style: TextStyle(
//                   fontSize: screenHeight * 0.022,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: screenHeight * 0.025),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: screenHeight * 0.2,
//                 width: screenWidth * 0.8,
//                 color: Color(0xF2F2F2),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(right: screenWidth * 0.36),
//                       child: Text(
//                         'i ve been tryna call',
//                         style: TextStyle(
//                           fontSize: screenHeight * 0.021,
//                           color: Colors.orange,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.015),
//                     Text(
//                       'ive been on my own for long enough',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.021,
//                         color: Colors.blue.shade900,
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.002),
//                     Text(
//                       '  Maybe you can show me how to love,',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.021,
//                         color: Colors.blue.shade900,
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.001),
//                     Text(
//                       ' Maybe Im goin through withdrawals ',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.021,
//                         color: Colors.blue.shade900,
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.001),
//                     Text(
//                       ' You dont even have to do too much  ',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.021,
//                         color: Colors.blue.shade900,
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.001),
//                     Text(
//                       'You can turn me on with just a          '
//                           '\n touch,baby',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.021,
//                         color: Colors.blue.shade900,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
