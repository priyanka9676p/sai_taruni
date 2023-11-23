import 'package:flutter/material.dart';
import '../view_all/articles.dart';

class Article extends StatelessWidget {
  final List<String> yourImageList = [
    'assets/article.png',
    'assets/articles.png',
    'assets/article.png',
    'assets/articles.png',
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
                  "Articles",
                  style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Color(0xFF1A315B)),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "View All" tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ArticlesListScreen()),
                    );
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: yourImageList.length,
              itemBuilder: (context, index) {
                String imagePath = yourImageList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.07),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.2,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                        width: screenWidth * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Impact of AI on Healthcare",
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A315B),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              "Here are several ways in which AI is impacting healthcare",
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
