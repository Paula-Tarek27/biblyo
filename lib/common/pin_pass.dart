import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For haptic feedback
import 'package:pin_code_fields/pin_code_fields.dart';
import '../view/menu/admin.dart';

class PinEntryPage extends StatefulWidget {
  @override
  _PinEntryPageState createState() => _PinEntryPageState();
}

class _PinEntryPageState extends State<PinEntryPage> {
  final String _correctPin = "1234";
  String enteredPin = "";

  void _checkPinAndNavigate() {
    if (enteredPin == _correctPin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddNewBookPage()), // Assuming AdminPage is your next page
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Incorrect PIN"),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter PIN'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: PinCodeTextField(
          appContext: context,
          length: 4,
          obscureText: true,
          obscuringCharacter: '•',
          animationType: AnimationType.scale,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.grey[300],
            selectedFillColor: Colors.lightBlue[100],
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.blue.shade50,
          enableActiveFill: true,
          onCompleted: (v) {
            enteredPin = v;
            _checkPinAndNavigate();
          },
          onChanged: (value) {
            enteredPin = value;
            HapticFeedback.lightImpact(); // Provide haptic feedback
          },
          beforeTextPaste: (text) {
            return true; // Allow pasting text
          },
        ),
      ),
    );
  }
}
