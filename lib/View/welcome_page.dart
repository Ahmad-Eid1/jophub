import 'package:ahmad/View/page_images.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late VideoPlayerController _controller;
  bool _isNavigating = false; // إضافة علامة لتجنب التنقل المتعدد

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/job_hub_mp4.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        _controller.play();
        setState(() {});
      });

    // تعيين مؤقت للتنقل بعد 5 ثواني
    Future.delayed(Duration(seconds: 5), navigateToImagePage);
  }

  // تنفيذ التنقل إلى ImagePage
  void navigateToImagePage() {
    if (!_isNavigating) { // التحقق من عدم بدء عملية التنقل بالفعل
      _isNavigating = true; // تعيين العلامة للدلالة على بدء التنقل
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageImage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _controller.value.isInitialized
              ? Positioned.fill(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
