import 'package:ahmad/Controller/authenticationController.dart';
import 'package:ahmad/View/creat_company_profile.dart';
import 'package:ahmad/View/editCoProfile.dart';
import 'package:ahmad/View/editProfile.dart';
import 'package:ahmad/View/home_page_company.dart';
import 'package:ahmad/View/home_page_user.dart';
import 'package:ahmad/View/login.dart';
import 'package:ahmad/View/myCoProfile.dart';
import 'package:ahmad/View/packagesScreen.dart';
import 'package:ahmad/View/page_images.dart';
import 'package:flutter/material.dart';
//import 'package:islam_my_uncle/PerProfile.dart';
//import 'package:islam_my_uncle/controller/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:ahmad/View/myProfile.dart';
import 'package:ahmad/View/creat_personal_profile.dart';
//import 'package:islam_my_uncle/CoProfile.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        debugShowCheckedModeBanner: false,
        home:creat_personal_profile(),
        theme: ThemeData.light(),
    );
  }
}
