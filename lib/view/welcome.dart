import 'package:ebook/common/color.dart';
import 'package:ebook/view/login/login.dart';
import 'package:ebook/view/login/signup.dart';
import 'package:flutter/material.dart';
class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/welcome_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Container(
              width: media.width,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: media.width * 0.25),
                  Text(
                    "Books for All",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: media.width * 0.25),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()
                      ));
                    },
                    textColor: Colors.white,
                    color: TColor.primary,
                    height: 50,
                    minWidth: double.maxFinite,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500)
                      ),
                    ),
                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()
                      ));
                    },
                    textColor: Colors.white,
                    color: TColor.primary,
                    height: 50,
                    minWidth: double.maxFinite,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                        "Signup",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500)
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
