import 'package:flutter/material.dart';
import '../../common/recently.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);
  List recentArr = [
    {
      "name": "Einstein",
      "author": "Walter Isaacson",
      "img": "assets/images/einstein.jpg"
    },
    {
      "name": "Steve Jobs",
      "author": "Walter Isaacson",
      "img": "assets/images/jobs.jpg"
    },
    {
      "name": "Nelson Mandela",
      "author": "Richard Stengel",
      "img": "assets/images/mandelas-way.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Biography")),
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
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var bObj = recentArr[index];
                  return Recently(iObj: bObj);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
