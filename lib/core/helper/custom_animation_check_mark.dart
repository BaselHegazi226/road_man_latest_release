import 'package:flutter/material.dart';

class CustomAnimatedCheckmark extends StatefulWidget {
  const CustomAnimatedCheckmark({super.key, required this.child});

  final Widget child;

  @override
  _CustomAnimatedCheckmarkState createState() =>
      _CustomAnimatedCheckmarkState();
}

class _CustomAnimatedCheckmarkState extends State<CustomAnimatedCheckmark>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Single cycle duration
    );

    // Define the scale animation with a pulsing effect
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart),
    );

    // Start the animation and repeat a few times, then stop
    _controller.repeat(reverse: true);
    Future.delayed(const Duration(seconds: 1), () {
      // Stop the animation after 3 seconds
      _controller.stop();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
