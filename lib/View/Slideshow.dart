import 'dart:async';
import 'package:flutter/material.dart';

class Slideshow extends StatefulWidget {
  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  late PageController _pageController;
  late Timer _timer;
  late List<String> _imagePaths;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _imagePaths = [
      'images/photo_2024-07-29_14-11-35.jpg',
      'images/photo_2024-07-29_14-11-51.jpg',
      'images/photo_2024-07-29_14-11-55.jpg',
      'images/photo_2024-07-29_14-12-02.jpg',
      'images/photo_2024-07-29_14-12-06.jpg',
      'images/photo_2024-07-29_14-12-12.jpg',
      'images/photo_2024-07-29_14-12-17.jpg',
    ];

    // إعداد Timer للانتقال التلقائي بين الصور
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.page == _imagePaths.length - 1) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // إلغاء Timer عند التخلص من الويدجت
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0), // ضبط الحافة العلوية لتحديد المسافة من الأعلى
        child: Container(
          height: 200, // حدد الارتفاع الذي تريده للحاوية
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: _imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200, // عرض كل صورة
                margin: EdgeInsets.symmetric(horizontal: 5.0), // الهوامش بين الصور
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    image: AssetImage(_imagePaths[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
