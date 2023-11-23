import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YourDataModel {
  final String imagePath;

  YourDataModel(this.imagePath);
}

class BannerWidget extends StatefulWidget {
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;
  List<YourDataModel> yourList = [];

  @override
  void initState() {
    super.initState();
    _fetchDataFromAPI();
  }

  Future<void> _fetchDataFromAPI() async {
    final response = await http.get(
      Uri.parse('http://ec2-15-207-196-141.ap-south-1.compute.amazonaws.com:8080/v1/banner/getall'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        yourList = data.map((item) => YourDataModel(item['Banner_location'])).toList();
      });
    } else {
      // Handle error
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.3),
              child: Container(
                height: screenHeight * 0.2,
                width: double.infinity,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: yourList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = yourList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            item.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.25,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: yourList.asMap().entries.map((entry) {
                  return Container(
                    width: screenHeight * 0.01,
                    height: screenHeight * 0.01,
                    margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.005),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key ? Colors.green : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



