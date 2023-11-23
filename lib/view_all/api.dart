// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
//
// class Api extends StatefulWidget {
//   const Api({super.key});
//
//   @override
//   State<Api> createState() => _ApiState();
// }
//
// class _ApiState extends State<Api> {
//   final player = AudioPlayer();
//
//   Future<void> play(String url) async {
//     await player.play(url);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 100,),
//             ElevatedButton(
//               onPressed: () {
//                 play('https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3');
//               },
//               child: Text("play"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
