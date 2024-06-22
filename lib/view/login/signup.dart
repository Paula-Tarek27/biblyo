import 'package:ebook/view/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/color.dart';
import '../../common/roundtext.dart';
import '../main/main_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo2.jpg", width: screenWidth * 0.8, height: 250),
              Text(
                "Signup",
                style: TextStyle(color: TColor.text, fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15),
              RoundTextFiled(controller: txtFName, hinText: "FirstName"),
              SizedBox(height: 15),
              RoundTextFiled(controller: txtLName, hinText: "LastName"),
              SizedBox(height: 15),
              RoundTextFiled(controller: txtEmail, hinText: "Email"),
              SizedBox(height: 15),
              RoundTextFiled(controller: txtPassword, hinText: "Password", obscureText: true),
              SizedBox(height: 15),
              RoundTextFiled(controller: txtConfirmPassword, hinText: "Confirm Password", obscureText: true),
              SizedBox(height: 15),
              RoundLineButton(
                title: "Signup",
                onPressed: () async {
                  try {
                   final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: txtEmail.text,
                        password: txtPassword.text,
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainTabView()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                }
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.black)),
                    Text(
                      'Signup With',
                      style: TextStyle(color: TColor.text),
                    ),
                    Expanded(child: Divider(thickness: 1.0, color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,// Handle your callback.
                    child: Ink(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/face.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),SizedBox(width: 60,),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,// Handle your callback.
                    child: Ink(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/google.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

