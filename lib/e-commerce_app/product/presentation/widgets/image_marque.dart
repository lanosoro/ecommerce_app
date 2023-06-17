import 'dart:async';

import 'package:flutter/material.dart';

class ImageMarquee extends StatefulWidget {
  const ImageMarquee({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageMarquee> createState() => _ImageMarqueeState();
}

class _ImageMarqueeState extends State<ImageMarquee> {
  final List<String> imageUrls = [
    "assets/e_commerce_app/e_commerce_image/banner1.png",
    "assets/e_commerce_app/e_commerce_image/banner2.png",
    "assets/e_commerce_app/e_commerce_image/banner3.png",
    "assets/e_commerce_app/e_commerce_image/2.png",
    "assets/e_commerce_app/e_commerce_image/1.jpg",

  ];
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 4;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  void _startTimer() {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        if (_pageController.positions.isNotEmpty) {
          if (_currentPage < imageUrls.length - 1) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeLeft: true,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),

            child: Container(
              padding: const EdgeInsets.all(10.0),

              width: 200,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
