import 'package:flutter/material.dart';
import '../../common/recently.dart';

class CategoriesPage3 extends StatelessWidget {
  CategoriesPage3({Key? key}) : super(key: key);
  List recentArr = [
    {
      "name": "The Girl who said NO",
      "author": "Eamille Manely",
      "img": "assets/images/ch1.jpg"
    },
    {
      "name": "The Heroes of Summer",
      "author": "Norris Mcdonald",
      "img": "assets/images/ch2.jpg"
    },
    {
      "name": "Alone",
      "author": "Megan E. Freeman",
      "img": "assets/images/alone.jpg"
    }
  ];
  List recentArr2 = [
    {
      "name": "Sam and Pam",
      "author": "Iris Grade",
      "img": "assets/images/ch3.jpg"
    },
    {
      "name": "Dr.Seuss",
      "author": "Andrew Joyner",
      "img": "assets/images/ch4.jpg"
    },
    {
      "name": "Harry Potter",
      "author": "J.K.Rowling",
      "img": "assets/images/ch5.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Children")),
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
