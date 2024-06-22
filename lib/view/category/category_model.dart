import 'package:flutter/material.dart';
import '../../common/recently.dart';

class CategoriesPage2 extends StatelessWidget {
  CategoriesPage2({Key? key}) : super(key: key);
  List recentArr = [
    {
      "name": "Read People Like Book",
      "author": "Patric King",
      "img": "assets/images/book9.jpg"
    },
    {
      "name": "Stop Overthinking",
      "author": "Nick Trenton",
      "img": "assets/images/overthink.jpg"
    },
    {
      "name": "How to Think like Sherlock",
      "author": "Daniel Smith",
      "img": "assets/images/sherlock think.jpg"
    }
  ];
  List recentArr2 = [
    {
      "name": "Atomic Habits ",
      "author": "James Clear",
      "img": "assets/images/atomic.jpg"
    },
    {
      "name": "The Power of Positive Thinking",
      "author": "Norman Vincent",
      "img": "assets/images/book2.jpg"
    },
    {
      "name": "How to Think",
      "author": "Patric King",
      "img": "assets/images/book4.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Life Style")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            /*Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "COMING SOON",
                      style: TextStyle(
                        color: Colors.black, // Change color as needed
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.black54),
                  ),
                ],
              ),
            ),*/
            SizedBox(
              height: media.width,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var bObj = recentArr[index];
                  return Recently(iObj: bObj);
                },
              ),
            ),
            SizedBox(
              height: media.width,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: recentArr2.length,
                itemBuilder: (context, index) {
                  var bObj = recentArr2[index];
                  return Recently(iObj: bObj);
                },
              ),
            ),
            /*SizedBox(
              height: media.width,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var bObj = recentArr[index];
                  return Recently(iObj: bObj);
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
