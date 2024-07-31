import 'package:ahmad/View/home_page_company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





class Companysingup extends StatelessWidget {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _signUp(BuildContext context) {
    final companyName = companyNameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (companyName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      // عرض رسالة تنبيه في حالة وجود حقول فارغة
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        icon: Icon(Icons.info_outline, color: Colors.white),
      );
    } else if (password != confirmPassword) {
      // عرض رسالة تنبيه في حالة عدم تطابق كلمة المرور وتأكيدها
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
        icon: Icon(Icons.warning_amber_rounded, color: Colors.white),
      );
    } else {
      // تنفيذ عملية الانتقال إلى الصفحة الأخرى
      Get.to(HomePageCom()); // الانتقال إلى الصفحة الأخرى باستخدام Get.to
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextField(
                controller: companyNameController,
                decoration: InputDecoration(
                  hintText: "Company name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  hintText: "Confirm your password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => _signUp(context),
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0XFF033043),
                ),
                child: Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('Welcome to Another Page!'),
      ),
    );
  }
}
