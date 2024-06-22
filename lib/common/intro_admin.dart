import 'package:ebook/common/pin_pass.dart';
import 'package:flutter/material.dart';

class AdminIntroPage extends StatelessWidget {
  const AdminIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning_amber_rounded,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              'This is out of your permission',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20,),
            TextButton(
              onPressed: () {
                // Implement what happens when you press this button
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 150),
                disabledBackgroundColor: Colors.white, disabledForegroundColor: Colors.grey.withOpacity(0.38),
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Back',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
            /*SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("This page is outside the scope of your use and is a page for Admins only. Thank you for your using Βιβλίο",
                style:TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold) ,
                ),
              ],
            ),*/
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Implement what happens when you press this button
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PinEntryPage()), // Define NextPage() or replace with actual page
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    disabledBackgroundColor: Colors.white, disabledForegroundColor: Colors.grey.withOpacity(0.38),
                    backgroundColor: Colors.white,
                  ),
                  child:Text(
                    'Admins Only',
                    style: TextStyle(fontSize: 18,color: Colors.black12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}