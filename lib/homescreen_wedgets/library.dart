import 'package:flutter/material.dart';

  class Library extends StatefulWidget {
  const Library({Key? key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildContainerItem('Audio Songs'),
            _buildContainerItem('Audio Messages'),
            _buildContainerItem('Audio 1'),
            _buildContainerItem('Audio 2'),
            _buildContainerItem('Audio 5'),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerItem(String text) {
    return Column(
      children: [
        Container(
          height: 130,
          width: 160,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/yt.png',
              width: 100,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,),
        ),
        TextButton(
          onPressed: () {
            // Implement view all functionality here
            print('View more clicked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('View more',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,color:Colors.black),),
              Icon(Icons.arrow_forward_outlined, size: 16,color:Colors.orange),
            ],
          ),
        ),
      ],
    );
  }
}