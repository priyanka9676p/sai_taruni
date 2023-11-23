import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArticlesListScreen extends StatefulWidget {
  const ArticlesListScreen({super.key});

  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  List<Map<String, String>> articles = [];

  @override
  void initState() {
    super.initState();
    // Call the API when the screen is first created
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final response = await http.get(
        Uri.parse("http://ec2-15-207-196-141.ap-south-1.compute.amazonaws.com:8080/v1/article/getall"));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        articles = data.map((article) {
          return {
            'imagePath': article['Banner_location'].toString(),
            'title': article['ArticleTitle'].toString(),
            'subtitle': article['content'].toString(),
          };
        }).toList();
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row containing back arrow and text
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.1),
            child: Row(
              children: [
                // Back arrow
                IconButton(
                  icon: Icon(Icons.arrow_back, size: screenWidth * 0.06),
                  onPressed: () {
                    // Handle back button press
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: screenWidth * 0.01),
                // Text
                Text(
                  'Articles ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  imagePath: articles[index]['imagePath']!,
                  title: articles[index]['title']!,
                  subtitle: articles[index]['subtitle']!,
                  screenWidth: screenWidth,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double screenWidth;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Container(
        height: screenWidth * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: screenWidth * 0.01,
              blurRadius: screenWidth * 0.02,
              offset: Offset(0, screenWidth * 0.03),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.02),
                topRight: Radius.circular(screenWidth * 0.02),
              ),
              child: Image.network(
                imagePath,
                height: screenWidth * 0.38,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF1A315B),
                  fontSize: screenWidth * 0.038,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Color(0xFFE10014),
                  fontSize: screenWidth * 0.032,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}