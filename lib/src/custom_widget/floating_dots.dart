import 'dart:math';
import 'package:flutter/material.dart';

class FloatingDotGroup extends StatefulWidget {
  final int number;
  final List<Color> colors;
  final double opacity;
  final random = Random();

  FloatingDotGroup({
    Key key,
    this.number = 25,
    this.colors = Colors.primaries,
    this.opacity = .5,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FloatingDotGroupState();
}

class FloatingDotGroupState extends State<FloatingDotGroup> {
  double radius;
  int time;

  List<Widget> buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < widget.number; i++) {
      radius = widget.random.nextDouble() * 2 + 5;
      time = widget.random.nextInt(45) + 7;
      dots.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: FloatingDot(
            radius: radius,
            color: widget.colors[widget.random.nextInt(widget.colors.length)]
                .withOpacity(widget.opacity),
            time: time,
          ),
        ),
      );
    }
    return dots;
  }

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: buildDots(),
      ),
    );
  }
}

class FloatingDot extends StatefulWidget {
  final double radius;
  final int time;
  final Color color;

  FloatingDot({
    Key key,
    @required this.radius,
    @required this.color,
    @required this.time,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FloatingDotState();
}

class FloatingDotState extends State<FloatingDot>
    with SingleTickerProviderStateMixin {
  Random random = Random();
  bool _vertical;
  bool _inverseDir;
  double _initialPosition;
  double _destination;
  double _start;
  double _fraction;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    _fraction = 0.0;
    _vertical = true;
    _inverseDir = false;
    _initialPosition = random.nextDouble();
    _destination = random.nextDouble();
    _start = 150 * random.nextDouble();
    controller = AnimationController(
      duration: Duration(seconds: widget.time),
      vsync: this,
    );

    controller
      ..addListener(() {
        setState(() {
          _fraction = controller.value;
        });
      });

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FloatingDot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.time != oldWidget.time) {
      controller.duration = Duration(seconds: widget.time);
      controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DotPainter(
        vertical: _vertical,
        inverseDir: _inverseDir,
        initialPosition: _initialPosition,
        destination: _destination,
        radius: widget.radius,
        start: _start,
        fraction: _fraction,
        color: widget.color,
      ),
    );
  }
}

class DotPainter extends CustomPainter {
  bool vertical;
  bool inverseDir;
  double initialPosition;
  double destination;
  double radius;
  double start;
  double diameter;
  double distance;
  double fraction;
  Color color;
  Paint _paint;

  DotPainter({
    this.vertical,
    this.inverseDir,
    this.initialPosition,
    this.destination,
    this.radius,
    this.start,
    this.fraction,
    this.color,
  }) : _paint = Paint() {
    _paint.color = color;
    diameter = radius * 2;
    distance = destination - initialPosition;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset offset;
    if (!this.vertical && this.inverseDir) {
      offset = Offset(
          -start - radius + (size.width + diameter + start) * fraction,
          size.height * (initialPosition + distance * fraction));
    } else if (this.vertical && this.inverseDir) {
      offset = Offset(size.width * (initialPosition + distance * fraction),
          -start - radius + (size.height + diameter + start) * fraction);
    } else if (!this.vertical && !this.inverseDir) {
      offset = Offset(
          size.width +
              start +
              radius -
              (size.width + diameter + start) * fraction,
          size.height * (initialPosition + distance * fraction));
    } else if (this.vertical && !this.inverseDir) {
      offset = Offset(
          size.width * (initialPosition + distance * fraction),
          size.height +
              start +
              radius -
              (size.height + diameter + start) * fraction);
    }

    canvas.drawCircle(offset, radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
