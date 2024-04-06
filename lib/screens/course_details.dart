import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:test_project/components/text_form_field.dart';

import '../components/button.dart';

class CourseDetails extends StatefulWidget {
  final String image;
  const CourseDetails({super.key, required this.image});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final courseKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool isLoading = false;

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill the field.';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    // Set the initial value of the course TextField
    course.text = widget.image;
  }

  // Function to send email
  Future<void> sendEmail(String name, String course, String email, String phone) async {
    final smtpServer = gmail('dhanwistest@gmail.com', 'dhanwistest.com');

    final message = Message()
      ..from = Address('dhanwistest@gmail.com', 'Dhanwis')
      ..recipients.add('sisolaw338@tanlanav.com') // Admin's email
      ..subject = 'New Contact Form Submission'
      ..text = 'Name: $name\nCourse: $course\nEmail: $email\nPhone: $phone';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent. Error: $e');
    }
  }

  Future<void> addContact(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (courseKey.currentState!.validate()) {
      String user = name.text;
      String subject = course.text;
      String mail = email.text;
      String mobile = phone.text;

      await FirebaseFirestore.instance.collection('contact').add({
        'name': user,
        'course': subject,
        'email': mail,
        'phone': mobile,
      });
      await sendEmail(user, subject, mail, mobile);
      name.clear();
      email.clear();
      phone.clear();
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully submitted'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black87,
          duration: const Duration(seconds: 3),
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black87,
          duration: const Duration(seconds: 3),
          dismissDirection: DismissDirection.horizontal,
          margin: EdgeInsets.only(bottom: 40, right: 20, left: 20),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.image,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: courseKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'CONTACT FORM',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          CustomTextInputField(
                            controller: name,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            validator: _validateInput,
                            hintText: 'Name',
                            prefixIcon: Icons.person,
                          ),
                          CustomTextInputField(
                            controller: course,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.none,
                            validator: _validateInput,
                            hintText: 'Course',
                            prefixIcon: Icons.menu_book,
                          ),
                          CustomTextInputField(
                            controller: email,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.emailAddress,
                            validator: _validateInput,
                            hintText: 'Email',
                            prefixIcon: Icons.mail,
                          ),
                          CustomTextInputField(
                            controller: phone,
                            textInputAction: TextInputAction.done,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.number,
                            validator: _validateInput,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            hintText: 'Phone Number',
                            prefixIcon: Icons.phone_android,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      isLoading
                          ? CircularProgressIndicator() // Show a loading indicator
                          : CustomButton(
                              onPressed: () => addContact(context),
                              text: 'SUBMIT',
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
