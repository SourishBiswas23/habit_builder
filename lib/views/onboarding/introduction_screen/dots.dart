import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app_theme.dart';

class Dots extends StatelessWidget {
  const Dots({
    super.key,
    required PageController controller,
    required List<Widget> pages,
  })  : _controller = controller,
        _pages = pages;

  final PageController _controller;
  final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _controller.animateToPage(
            _pages.length - 1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          child: Text(
            'Skip',
            style: theme.textTheme.bodyMedium,
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: _pages.length,
          effect: const WormEffect(
            dotColor: AppTheme.morning,
            activeDotColor: AppTheme.eclipse,
          ),
          onDotClicked: (index) => _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
        ),
        GestureDetector(
          onTap: () => _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          child: Text(
            'Next',
            style: theme.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
