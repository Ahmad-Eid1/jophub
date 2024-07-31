import 'package:ahmad/View/WavePainter.dart';
import 'package:flutter/material.dart';


class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
   @override
  Widget build(BuildContext context) {
    
    return Scaffold(body: Stack(
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
                'Favorite',
                style: TextStyle(
                color:Color(0XFFE9E3D5),
                  fontSize: 40,
                 fontWeight: FontWeight.bold,
                ),
              ),
            ),
          
          ),]));
  }
}