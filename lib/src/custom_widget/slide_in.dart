import 'package:flutter/material.dart';

class SlideIn extends StatefulWidget {
  final Widget child;
  final Duration duration;

  SlideIn({
    this.child,
    this.duration,
  });

  @override
  _SlideInState createState() => _SlideInState();
}

class _SlideInState extends State<SlideIn>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetFloat =
        Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SlideTransition(
      position: _offsetFloat,
      child: FadeTransition(
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
