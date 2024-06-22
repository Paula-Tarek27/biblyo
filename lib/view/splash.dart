import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ebook/common/color.dart';
import 'package:flutter/material.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 8));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingView()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo2.jpg',
              width: 200.0,
              height: 200.0,
            ),
            //SizedBox(height: 10),
        AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('Βιβλίο',textStyle: TextStyle(
              color: Colors.green,fontSize: 40,fontWeight: FontWeight.bold
            ),
              speed: Duration(milliseconds: 200)
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}



