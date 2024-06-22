import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../common/color.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  String selectedCardType = 'VISA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: Text('Credit Card Payment', style: TextStyle(color: TColor.text, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name on Card',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your name';
                  return null;
                },
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('VISA', style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Radio<String>(
                  value: 'VISA',
                  groupValue: selectedCardType,
                  onChanged: (value) {
                    setState(() {
                      selectedCardType = value!;
                    });
                  },
                ),
                trailing: Image.asset('assets/images/visa.jpg', width: 60),
              ),
              ListTile(
                title: Text('MasterCard', style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Radio<String>(
                  value: 'MasterCard',
                  groupValue: selectedCardType,
                  onChanged: (value) {
                    setState(() {
                      selectedCardType = value!;
                    });
                  },
                ),
                trailing: Image.asset('assets/images/mastercard.jpg', width: 60),
              ),
              TextFormField(
                controller: cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'Enter your 16-digit card number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 16) {
                    return 'Please enter a valid 16-digit card number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('/') || value.length != 5) {
                          return 'Enter a valid expiry date (MM/YY)';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: 'Enter your 3-digit CVV',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length != 3) {
                          return 'Enter a valid 3-digit CVV';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primary,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    savePaymentDetails();
                  }
                },
                child: Text('Make Payment', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void savePaymentDetails() {
    FirebaseFirestore.instance.collection('payments').add({
      'name': nameController.text,
      'cardType': selectedCardType,
      'cardNumber': cardNumberController.text,
      'expiryDate': expiryDateController.text,
      'cvv': cvvController.text,
    }).then((value) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Payment Successful',
        desc: 'Your payment has been successfully processed.',
        autoHide: Duration(seconds: 3),
      ).show();
    }).catchError((error) {
      print("Failed");
    }
    );
  }
}

