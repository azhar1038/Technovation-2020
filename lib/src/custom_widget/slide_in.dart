import 'package:flutter/material.dart';

class SlideIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double startX;
  final double startY;

  SlideIn({
    this.child,
    this.duration,
    this.startX = 0,
    this.startY = 0.5,
  })  : assert(startX >= -1 && startX <= 1),
        assert(startY >= -1 && startY <= 1);

  @override
  _SlideInState createState() => _SlideInState();
}

class _SlideInState extends State<SlideIn> with SingleTickerProviderStateMixin {
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
        Tween<Offset>(begin: Offset(widget.startX, widget.startY), end: Offset.zero).animate(
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
