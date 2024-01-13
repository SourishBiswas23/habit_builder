import 'package:flutter/material.dart';

import 'dots.dart';
import 'first_screen.dart';
import 'fourth_screen.dart';
import 'get_started_button.dart';
import 'second_screen.dart';
import 'third_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final List<Widget> _pages = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const FourthScreen(),
  ];

  late final PageController _controller;
  bool _isLastPage = false;

  @override
  void initState() {
    _controller = PageController();
    _controller.addListener(() {
      if (_controller.page == _controller.page?.roundToDouble() &&
          _controller.page == _pages.length - 1) {
        // The user is at the last page
        setState(() {
          _isLastPage = true;
        });
      } else {
        // the user was at the last page but has scrolled back
        if (_isLastPage) {
          setState(() {
            _isLastPage = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: PageView.builder(
          itemBuilder: (context, index) {
            return _pages[index];
          },
          itemCount: _pages.length,
          controller: _controller,
        ),
      ),
      bottomSheet: _isLastPage
          ? const GetStartedButton()
          : Container(
              color: Colors.white,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Dots(
                controller: _controller,
                pages: _pages,
              ),
            ),
    );
  }
}
