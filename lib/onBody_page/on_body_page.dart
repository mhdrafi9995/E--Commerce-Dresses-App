import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mechine_test/onBody_page/1srt_page.dart';
import 'package:mechine_test/onBody_page/2nd_page.dart';
import 'package:mechine_test/onBody_page/3rd_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../view/pages/home_pages.dart';

class OnBodyPage extends StatefulWidget {
  const OnBodyPage({super.key});

  @override
  State<OnBodyPage> createState() => _OnBodyPageState();
}

class _OnBodyPageState extends State<OnBodyPage> {
  PageController _pageController = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              WelcomefirstPage1(),
              WelcomefirstPage2(),
              WelcomefirstPage3(),
            ],
          ),
          // dot indicator
          Container(
              alignment: Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 18),
                    ),
                  ),
                  SmoothPageIndicator(controller: _pageController, count: 3),
                  // onpageLast
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Get.offAll(() => HomePage());
                            _pageController.nextPage(
                                duration: Duration(microseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            "Done",
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 18),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: Duration(microseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            "Next",
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 18),
                          ),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
