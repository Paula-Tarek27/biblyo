import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebook/common/color.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = false;
  bool valNotify2 = true;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: TColor.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            sectionTitle(Icons.person, "Account"),
            Divider(height: 20, thickness: 1),
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Privacy and Security"),
            buildAccountOption(context, "Social"),
            SizedBox(height: 40),
            sectionTitle(Icons.volume_up_outlined, "Notifications"),
            Divider(height: 20, thickness: 1),
            buildNotificationOption("Dark Mode", valNotify1, onChangeFunction1),
            buildNotificationOption("Active Profile", valNotify2, onChangeFunction2),
            buildNotificationOption("Notification", valNotify3, onChangeFunction3),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: () {},
                child: Text("Logout", style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.2,
                    color: Colors.black
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding sectionTitle(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: TColor.primary),
          SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: dialogContent(title),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")
                  )
                ],
              );
            }
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  List<Widget> dialogContent(String title) {
    switch (title) {
      case 'Change Password':
        return [Text("Change your password")];
      case 'Language':
        return [Text("English"), Text("Arabic")];
      case 'Privacy and Security':
        return [Text("Privacy settings"), Text("Security settings")];
      case 'Social':
        return [Text("Connect to Facebook"), Text("Connect to Twitter")];
      default:
        return [Text("Option 1"), Text("Option 2")];
    }
  }

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: TColor.text
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
                value: value,
                activeColor: TColor.primary,
                trackColor: Colors.grey,
                onChanged: (bool newValue) {
                  onChangeMethod(newValue);
                }
            ),
          )
        ],
      ),
    );
  }
}
