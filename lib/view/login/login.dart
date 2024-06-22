import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebook/common/color.dart';
import 'package:ebook/common/roundtext.dart';
import 'package:ebook/view/login/forget_pass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main/main_view.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login",
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 15,
              ),
             RoundTextFiled(
               controller: txtName,
               hinText: "Username",
             ),
              SizedBox(height: 15,
              ),
              RoundTextFiled(
                  controller: txtEmail,
                  hinText: "Email"
              ),
              SizedBox(height: 15,
              ),
              RoundTextFiled(
                  controller: txtPassword,
                  hinText: "Password",
                obscureText: true,
              ),
              SizedBox(height: 15,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        setState(() {
                          isStay = !isStay;
                        });
                      },
                      icon: Icon(
                        isStay
                        ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: isStay ? TColor.primary : TColor.subTitle.withOpacity(0.3),
                      ),
                  ),
                  Text(
                    "First Login",
                    style: TextStyle(
                      color: TColor.subTitle.withOpacity(0.3)
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                    },
                  child: Text("Forget Password",
                  style: TextStyle(
                    fontSize: 17,
                    color: TColor.subTitle.withOpacity(0.3)
                  ),),)
                ],
              ),
              SizedBox(height: 15,
              ),
              RoundLineButton(
                title: "Login",
                onPressed: () async {
                  try {
                    final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: txtEmail.text,
                      password: txtPassword.text,
                    );
                    // If the user is signed in, navigate to the MainTabView
                    if (userCredential.user != null) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainTabView()));
                    }
                  } on FirebaseAuthException catch (e) {
                    String errorMessage;
                    if (e.code == 'user-not-found') {
                      errorMessage = 'No user found for that email.';
                    } else if (e.code == 'wrong-password') {
                      errorMessage = 'Wrong password provided for that user.';
                    } else {
                      errorMessage = 'Wrong password provided for that user.';
                    }
                    // Show the dialog with the error message
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: errorMessage,
                    )..show();
                  }
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
