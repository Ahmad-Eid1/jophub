import 'package:ahmad/View/companysingup.dart';
import 'package:ahmad/View/usersingup.dart';
import 'package:flutter/material.dart';




class singup extends StatelessWidget {
  const singup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
        Color(0XFFE9E3D5),
          Color(0XFF033043),
          Color(0XFF092337)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 50),),
                  SizedBox(height: 10,),
                  Text('Welcome', style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 100,
                      blurRadius: 100,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: DefaultTabController(
                    length: 2, // عدد التبويبات
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          labelColor: Color(0XFF033043),
                          indicatorColor:  Color(0XFF033043),
                          tabs: [
                            Tab(text: 'User'),
                            Tab(text: 'Company'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Usersingup(),
                              companysingup(),
                            ],
                          ),
                        ),
                      ],
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
