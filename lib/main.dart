import 'package:ebook/view/login/login.dart';
import 'package:ebook/view/login/signup.dart';
import 'package:ebook/view/main/main_view.dart';
import 'package:ebook/view/onboarding.dart';
import 'package:ebook/view/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'common/color.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('----------User is currently signed out!');
      } else {
        print('++++++++++User is signed in!');
      }
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TColor.primary,
      ),
      home: FirebaseAuth.instance.currentUser == null? SplashScreen() : MainTabView(),
    );
  }
}



/*  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TColor.primary,
      ),
      home: const SplashScreen() , //splash screen
    );
  }*/


