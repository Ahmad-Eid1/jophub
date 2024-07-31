import 'package:ahmad/View/WavePainter.dart';
import 'package:ahmad/View/code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Get.snackbar(
        'Notice',
        'Please check your email for reset instructions',
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        icon: Icon(Icons.info_outline, color: Colors.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 200),
            painter: WavePainter(),
          ),
          Positioned(
            top: 60, // يمكنك تغيير هذه القيمة لتحديد موقع النص
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 230), // Add some space at the top
                    Text(
                      'Mail address Here',
                      style: TextStyle(color: Color(0XFF092337), fontSize: 30),
                    ),
                    SizedBox(height: 17),
                    Text(
                      'Enter the email address associated',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    SizedBox(height: 9),
                    Text(
                      'With your account',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        labelText: 'Email Address',
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 48),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => code()),
                          );
                          Get.snackbar(
                            'Success',
                            'Reset instructions sent',
                            backgroundColor: Colors.black.withOpacity(0.5),
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: EdgeInsets.all(10),
                            borderRadius: 10,
                            icon: Icon(Icons.check_circle_outline, color: Colors.white),
                          );
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0XFF092337),
                        ),
                        child: Center(
                          child: Text(
                            'Send Reset Instructions',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
