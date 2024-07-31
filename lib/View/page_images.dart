
//import 'package:ahmad/Controller/carouselcontoller.dart';
import 'package:ahmad/View/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PageImage extends StatefulWidget {
 // const PageImage({Key key}) : super(key: key);

  @override
  State<PageImage> createState() => _PageImageState();
}

class _PageImageState extends State<PageImage> {
  final List<String> images = [
    'images/photo_2024-07-29_16-08-27.jpg',
    'images/photo_2024-07-29_16-08-34.jpg',
    'images/photo_2024-07-29_16-13-27.jpg',
  ];

  final List<String> captions = [
    'Your Ambition. Our Mission',
    'Your Journey to Success Starts Here',
    'Turning Passions into Paychecks',
  ];

  CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  List<Widget> generateImageTiles(Size screenSize) {
    return images.asMap().entries.map((entry) {
      int idx = entry.key;
      String imgPath = entry.value;
      String caption = captions[idx];

      return Stack(
        children: <Widget>[
          // Image
          Positioned.fill(
            child: Image.asset(imgPath, fit: BoxFit.cover),
          ),
          // Caption
          Positioned(
            bottom: 30, // Increase the bottom value to raise the caption
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0), // Adjust padding as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: Text(
                caption,
                style: TextStyle(
                  color: Color(0XFFE9E3D6),
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Slider indicators
          Positioned(
            bottom: 10, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.white
                        : Color.fromARGB(255, 11, 33, 50).withOpacity(0.4),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }).toList();
  }

  void navigateToNextPage() {
    // Check if the current index is at the end of the images list
    if (_currentIndex == images.length - 1) {
      // Navigate to the next page here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login())
        ,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: generateImageTiles(screenSize),
              carouselController: _controller,
              options: CarouselOptions(
                enlargeCenterPage: true,
                // autoPlay: true,
                viewportFraction: 1.0,
                aspectRatio: screenSize.aspectRatio,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                    navigateToNextPage(); // Check for end of images list
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}