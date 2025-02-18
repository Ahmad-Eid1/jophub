import 'package:ahmad/Model/personalData.dart';
import 'package:ahmad/View/My_Post%20.dart';
import 'package:flutter/material.dart';

// كلاس بيانات الشخصية

class myProfile extends StatelessWidget {
  final Personal personal = Personal(
    name: 'Talal Skekar',
    jobTitle: 'Information technology',
    country: 'USA',
    description: 'Tech Solutions is a leading innovator .',
    personalSkills: 'Innovation, Excellence, Commitment',
    gender: 'male',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff033043),
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              // صورة دائرية للملف الشخصي
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("images/IMG_٢٠٢٢٠٢٢١_١٢٣٤٤٤.jpg"),
              ),
              SizedBox(height: 30),
              buildProfileItem(Icons.account_box_rounded, 'Name', personal.name),
              buildProfileItem(Icons.location_city, 'Country', personal.country),
              buildProfileItem(Icons.work, 'Job Title', personal.jobTitle),
              buildProfileItem(Icons.accessibility_rounded, 'Gender', personal.gender),
              buildProfileItem(Icons.description_outlined, 'Description', personal.description),
              buildProfileItem(Icons.calendar_month_outlined, 'Personal Skills', personal.personalSkills),
              SizedBox(height: 20),
              buildButtonsRow(context),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildProfileItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildMyPostsButton(BuildContext context) {
    return ElevatedButton(
      child: Text('My Posts', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // لون الزر
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => My_post(),),
        );
      },
    );
  }

  Widget buildButtonsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(width: 10),
          buildMyPostsButton(context),
        ],
      ),
    );
  }
}
