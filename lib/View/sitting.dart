import 'package:ahmad/View/WavePainter.dart';
import 'package:ahmad/View/about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sitting extends StatelessWidget {

  void _showLanguageDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Choose Language'),
        actions: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  TextButton(
                    child: Text('English', style: TextStyle(color: Color(0XFF033043))),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text('Arabic', style: TextStyle(color: Color(0XFF033043))),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              TextButton(
                child: Text('Close', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
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
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Setting',
                style: TextStyle(
                  color: Color(0XFFE9E3D5),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.language, color: Color.fromARGB(255, 14, 71, 96)),
                  title: Text('Language'),
                  onTap: _showLanguageDialog,
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.dark_mode_rounded, color: Color.fromARGB(255, 14, 71, 96)),
                  title: Text('Dark Mode'),
                  onTap: () {
                    if (Get.isDarkMode) {
                      Get.changeTheme(ThemeData.light());
                    } else {
                      Get.changeTheme(ThemeData.dark());
                    }
                  },
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.info_rounded, color: Color.fromARGB(255, 14, 71, 96)),
                  title: Text('About'),
                  onTap: () {
                    // الانتقال إلى صفحة About
                    Get.to(() => AboutPage());
                  },
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.logout, color: Color.fromARGB(255, 14, 71, 96)),
                  title: Text('Logout'),
                  onTap: _showLanguageDialog,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
