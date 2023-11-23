import 'package:flutter/material.dart';

class Magzine extends StatelessWidget {
  final List<String> yourImageList = [
    'assets/article.png',
    'assets/articles.png',
    'assets/article.png',
    'assets/articles.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                  "Magazines",
                  style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Color(0xFF1A315B)),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "View All" tap
                    print("View All tapped!");
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
              scrollDirection: Axis.vertical,
              itemCount: yourImageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.16,
                  margin: EdgeInsets.all(screenWidth * 0.02),
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(screenWidth * 0.05),
                              child: Image.asset(
                                yourImageList[index],
                                fit: BoxFit.cover,
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fashion and Style",
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A315B),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              children: [
                                Text(
                                  "Open in pdf",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.black,
                                  size: screenWidth * 0.06,
                                ),
                              ],
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
