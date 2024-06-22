import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Book/books.dart';
import '../../common/color.dart';
import '../../common/recently.dart';
import '../../Model/book_model.dart'; // Ensure this import is correct
import '../shipping/cart_controlar.dart'; // Ensure this import is correct

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final CartController controller = Get.find<CartController>();
  final List<Map<String, String>> recentArr = [
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
      "name": "Alone",
      "author": "Megan E. Freeman",
      "img": "assets/images/alone.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Account "), backgroundColor: TColor.primary),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Books()  ) );
          // Define action
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: TColor.primary,
                          )
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("assets/images/paula.jpg", fit: BoxFit.cover, width: 120, height: 120),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Paula Tarek", style: TextStyle(color: TColor.text, fontWeight: FontWeight.bold, fontSize: 30)),
                    Text("Paula@gmail.com", style: TextStyle(color: TColor.subTitle, fontSize: 15)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Books:", style: TextStyle(color: TColor.text, fontSize: 20)),
                  SizedBox(height: 10),
                  Container(
                    height: media.width * 0.8, // Adjusted height to be less than screen width
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentArr.length,
                      itemBuilder: (context, index) {
                        var book = recentArr[index];
                        return Recently(iObj: book);
                      },
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
}
