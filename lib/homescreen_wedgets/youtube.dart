import 'package:flutter/material.dart';

import '../view_all/articles.dart';

class Youtube extends StatelessWidget {
  final List<String> yourImageList = [
    'assets/youtube.png',
    'assets/yt.png',
    'assets/youtube.png',
    'assets/yt.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Youtube",
                  style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Color(0xFF1A315B)),
                ),
                GestureDetector(
                  // onTap: () {
                  //   // Handle "View All" tap
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ArticleScreen()),
                  //   );
                  // },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: screenHeight * 0.4,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: yourImageList.map((imagePath) {
                  return Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(screenWidth * 0.07),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: screenWidth * 0.8, // Responsive width
                            height: screenHeight * 0.2, // Responsive height
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                          width: screenWidth * 0.8, // Responsive width
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Personal development\n tips and advice",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A315B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
