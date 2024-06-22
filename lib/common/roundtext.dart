import 'package:ebook/common/color.dart';
import 'package:flutter/material.dart';
class RoundTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final TextInputType? keyboardType;
  final bool obscureText;
  const RoundTextFiled({super.key, required this.controller, required this.hinText, this.keyboardType, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.textbox, borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: hinText,
          labelStyle: TextStyle(
            fontSize: 15
          ),
        ),
      ),
    );
  }
}

class RoundLineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundLineButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: getColor(Colors.white, TColor.primary),
          foregroundColor: getColor(TColor.primary, Colors.white),
          shadowColor: MaterialStateProperty.resolveWith((states) => TColor.primary),
          minimumSize: MaterialStateProperty.resolveWith((states) => Size(double.maxFinite,50)),
        elevation: MaterialStateProperty.resolveWith((states) =>states.contains(MaterialState.pressed)? 1: 0),
        shape: MaterialStateProperty.resolveWith((states) =>RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide(
    width: 1,
    color: states.contains(MaterialState.pressed)
    ? Colors.transparent : TColor.primary
    ),
    ),
    )
    ), child: Text(
      title,
      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
    ),
    );
  }
  MaterialStateProperty<Color>getColor (Color color, Color colorpressed) {
    return MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed) ?colorpressed:color);
  }
}

