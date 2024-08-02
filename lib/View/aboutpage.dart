import 'package:ahmad/View/WavePainter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class aboutPage extends StatefulWidget {
  const aboutPage({super.key});

  @override
  State<aboutPage> createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
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
                'About',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: 
              
               SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 230), // Add some space at the top
                    Text(
                      'The task of job searching and advertising',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                    SizedBox(height: 17),
                    Text(
                      'ob vacancies has taken various  forms and',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                    SizedBox(height: 9),
                    Text(
                      'methods that have evolved over time.',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                   SizedBox(height: 17),
                    Text(
                      'With the revolution of software and',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                     SizedBox(height: 17),
                    Text(
                      'information technology, it became necessary to ',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                      SizedBox(height: 17),
                    Text(
                      ' necessary to create a system',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                     SizedBox(height: 17),
                    Text(
                      ' that organizes the job search and ',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                     SizedBox(height: 17),
                    Text(
                      ' job posting process, forming a convenient ',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                      SizedBox(height: 17),
                    Text(
                      '  and comprehensive',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                     SizedBox(height: 17),
                    Text(
                      'model to fulfill this task effectively. That is why ',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                     SizedBox(height: 17),
                    Text(
                      'our application, "Job Hub," was developed.',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                     SizedBox(height: 17),


      ],
    
      ),
               )
               )
               
               ])
    );
  }
}
