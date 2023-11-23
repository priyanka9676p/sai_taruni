import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MagzinesScreen extends StatefulWidget {
  const MagzinesScreen({Key? key}) : super(key: key);

  @override
  State<MagzinesScreen> createState() => _MagzinesScreenState();
}

class _MagzinesScreenState extends State<MagzinesScreen> {
  List<String> magazineImages = [
    'assets/yt1.png',
    'assets/yt2.png',
    'assets/yt3.png',
  ];
  List<String> magazineTexts = [
    'Home Decor & Design Ideas',
    'Travel Destination & Tips',
    'Tech-reviews & Guide',
  ];

  List<String> magazineSubTexts = [
    'This encompasses various elements, including furniture,\ncolor schemes, lighting, accessories, and overall layout.',
    'It relates to places where people can visit and advice on\nhow to make the most of their travel experiences',
    'Providing valuable information for consumers and\nenthusiasts',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.02, top: screenSize.width * 0.08, right: screenSize.width * 0.02),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                Text(
                  'Magazines',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.052,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: magazineImages.length,
              itemBuilder: (context, index) {
                return buildMagazineItem(
                  screenSize,
                  magazineImages[index],
                  magazineTexts[index],
                  magazineSubTexts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMagazineItem(Size screenSize, String imagePath, String boldText, String normalText) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.015),
      child: Card(
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.fill,
              height: screenSize.height * 0.2,
            ),
            Positioned(
              bottom: screenSize.width * 0.015,
              right: screenSize.width * 0.02,
              child: GestureDetector(
                onTap: launchPDFUrl,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenSize.width * 0.02),
                    child: Icon(
                      Icons.picture_as_pdf,
                      color: Colors.white,
                      size: screenSize.width * 0.05,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: screenSize.width * 0.015,
              left: screenSize.width * 0.02,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    boldText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    normalText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.width * 0.020,
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

  void launchPDFUrl() async {
    const pdfUrl = 'https://s3-btm.s3.ap-south-1.amazonaws.com/uploads/b971293d-6c42-4434-9be2-55396c8f92fa-API_Quick_reference.pdf';

    if (await canLaunch(pdfUrl)) {
      await launch(pdfUrl);
    } else {
      // Handle error
      print('Could not launch $pdfUrl');
    }
  }
}
