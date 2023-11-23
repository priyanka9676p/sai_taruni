import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../view_all/music.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List<YourDataModel> yourList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("http://ec2-15-207-196-141.ap-south-1.compute.amazonaws.com:8080/v1/article/getall"),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<YourDataModel> newList = data.map((item) {
          return YourDataModel(
            item["ArticleTitle"],
            item["content"],
            item["Banner_location"],
          );
        }).toList();

        setState(() {
          yourList = newList;
        });
      } else {
        // Handle error
        print("Error fetching data: ${response.statusCode}");
        // You can show a user-friendly message or log the error for debugging
      }
    } catch (error) {
      // Handle other exceptions that might occur during the request
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Music",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A315B),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MusicListScreen()),
                    );
                  },
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
            height: screenHeight * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: yourList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = yourList[index];
                return Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02, right: screenWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        child: Image.network(
                          item.imagePath,
                          fit: BoxFit.cover,
                          width: screenWidth * 0.4,
                          height: screenWidth * 0.4,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                        width: screenWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A315B),
                              ),
                            ),
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: screenWidth * 0.02,
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

class YourDataModel {
  final String title;
  final String subtitle;
  final String imagePath;

  YourDataModel(this.title, this.subtitle, this.imagePath);
}
