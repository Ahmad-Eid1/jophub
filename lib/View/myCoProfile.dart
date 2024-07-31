import 'dart:io';
import 'package:ahmad/Controller/authenticationController.dart';
import 'package:ahmad/Model/companyData.dart';
import 'package:ahmad/Model/customFromField.dart';
import 'package:ahmad/View/My_Post%20.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myProfile.dart';

class MyCoProfile extends StatefulWidget {
  @override
  _MyCoProfileState createState() => _MyCoProfileState();
}

class _MyCoProfileState extends State<MyCoProfile> {
  final Company company = Company(
    name: 'Soft Life',
    specialization: 'Information technology',
    country: 'Syria',
    website: 'WWW.softlife.com',
    description: 'An information technology company',
    location: 'Damascus, Al-Abed Street',
  );

  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff033043),
      appBar: AppBar(
        title: Text('My Co Profile'),
        backgroundColor: Color(0xff033043),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("images/pexels-pixabay-273250.jpg"),
              ),
              SizedBox(height: 8),
              Container(
                child: Column(
                  children: [
                    Text('100K', style: TextStyle(fontSize: 20, color: Colors.white60)),
                    Text('Followers', style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 30),
              buildProfileItem(Icons.abc_outlined, 'Name', company.name),
              buildProfileItem(Icons.work, 'Specialization', company.specialization),
              buildProfileItem(Icons.location_city, 'Country', company.country),
              buildProfileItem(Icons.web, 'Website', company.website),
              buildProfileItem(Icons.description_outlined, 'Description', company.description),
              buildProfileItem(Icons.location_city_outlined, 'Location', company.location),
              SizedBox(height: 20),
              buildButtonsRow(context), // إضافة صف الأزرار هنا
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

  Widget buildFollowButton() {
    return ElevatedButton.icon(
      icon: Icon(isFollowing ? Icons.check : Icons.person_add, color: Colors.white),
      label: Text(isFollowing ? 'Following' : 'Follow', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: isFollowing ? Colors.green : Colors.blue, // تغيير اللون بناءً على حالة المتابعة
      ),
      onPressed: () {
        setState(() {
          isFollowing = !isFollowing;
        });
      },
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
          buildFollowButton(),
          SizedBox(width: 10),
          buildMyPostsButton(context),
        ],
      ),
    );
  }
}

// صفحة my posts الجديدة

