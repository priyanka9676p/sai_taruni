import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child: BackButton(),onTap: () {},),
        title: Text('Videos',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30,bottom: 15),
            child: Container(
              height: 180,
              width: 340,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFFF2F2F2),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Rectangle 7.jpg'),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Center(child: Image(image: AssetImage('assets/Vector.jpg'),)),

                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Photography and Editing Tips',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Provide tutorials on photo and video editing',style: TextStyle(fontSize: 10,),),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30,bottom: 15),
            child: Container(
              height: 180,
              width: 340,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFFF2F2F2),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/flower.png'),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Center(child: Image(image: AssetImage('assets/Vector.jpg'),)),

                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Motivational and Inspirational Talks',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Provide motivational speeches and positive messages',style: TextStyle(fontSize: 10,),),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30,bottom: 15),
            child: Container(
              height: 180,
              width: 340,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFFF2F2F2),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Rectangle 7.png'),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Center(child: Image(image: AssetImage('assets/Vector.jpg'),)),

                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Career and Professional Advice',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Discuss your professional journey and lessons learned',style: TextStyle(fontSize: 10,),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}