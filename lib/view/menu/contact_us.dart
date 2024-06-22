import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebook/common/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController messageController = TextEditingController();
  final TextEditingController emailController = TextEditingController(); // Added for email input
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void sendMessage() async {
    if (messageController.text.isNotEmpty && emailController.text.isNotEmpty) {
      await _firestore.collection('messages').add({
        'email': emailController.text, // Store email along with message
        'message': messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((value) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          title: 'Success',
          desc: 'Message sent successfully!',
          btnOkOnPress: () {},
          btnOkIcon: Icons.check_circle,
          onDismissCallback: (type) {
            messageController.clear();
            emailController.clear(); // Clear email field along with message field
          },
        )..show();
      }).catchError((error) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: 'Error',
          desc: 'Failed to send message: $error',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
        )..show();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Contact Us', style: TextStyle(color: TColor.text)),
    backgroundColor: TColor.primary,
    elevation: 0,
    ),
    resizeToAvoidBottomInset: true,
    backgroundColor: Colors.white,
    body: Padding(
    padding: EdgeInsets.all(20.0),
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Contact Information:',
    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    ),
    Divider(
    height: 10,
    thickness: 5,
    indent: 20,
    endIndent: 0,
    color: Colors.grey[600],
    ),
    SizedBox(height: 10.0),
    Text(
    'Email: contact@Biblyo.com',
    style: TextStyle(fontSize: 16.0, color: TColor.text),
    ),
    Text(
    'Phone: 123-456-7890',
    style: TextStyle(fontSize: 16.0, color: TColor.text),
    ),
    SizedBox(height: 20.0),
    Text(
    'Your Email:',
    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    TextField(
    controller: emailController,
    decoration: InputDecoration(
    hintText: 'Enter your email',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 20.0),
    Text(
    'Send Us a Message:',
    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    TextField(
    controller: messageController,
    decoration: InputDecoration(
    hintText: 'Enter your message',
    border: OutlineInputBorder(),
    ),
    maxLines: 5,
    ),
    SizedBox(height: 20.0),
    ElevatedButton(
    onPressed: sendMessage,
    style: ElevatedButton.styleFrom(backgroundColor: TColor.primary),
    child: const Text('Send', style: TextStyle(fontSize: 12, color: Colors.black)),
    ),
    SizedBox(height: 10.0),
    Text(
    'For any issues or queries, please contact our support team at support@@Biblyo.com.',
    style: TextStyle(fontSize: 16.0, color: TColor.text),
    ),
    SizedBox(height: 20),
    Divider(
    height: 10,
    thickness: 5,
    indent: 20,
    endIndent: 0,
    color: Colors.grey[600],
    ),
    SizedBox(height: 20.0),
    Text(
    'FAQs:',
    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10.0),
    Text(
    'Additional Support Options:',
    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10.0),
    Text(
      'You can also visit our website for more information or connect with us on social media.',
      style: TextStyle(
          color: TColor.text
      ),
    ),
      ],
    ),
    ),
    ),
    );
  }
}
