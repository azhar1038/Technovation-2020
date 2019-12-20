import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;

  FadeIn({
    @required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController _opacityController;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _opacityController =
        AnimationController(vsync: this, duration: widget.duration);
    _opacity = Tween<double>(begin: 0, end: 1).animate(_opacityController);
    _opacityController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) _opacityController.forward();
    });
    _opacityController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // _opacityController.forward();
    return FadeTransition(
      opacity: _opacity,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(FadeIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    _opacityController.reset();
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }
}
