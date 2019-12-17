import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSize {
  final String title;

  @override
  final Size preferredSize;

  TopBar({@required this.title}) : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: CustomPaint(
          painter: BeveledPainter(
            background: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.title,
                ),
                Icon(
                  Icons.notifications_none,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => null;
}

class BeveledPainter extends CustomPainter {
  Color background;

  BeveledPainter({
    @required this.background,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double cross = size.height / 3;
    var paint = Paint();
    paint.color = background;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, cross);
    path.lineTo(cross, 0);
    path.lineTo(size.width - cross, 0);
    path.lineTo(size.width, size.height - cross);
    path.lineTo(size.width - cross, size.height);
    path.lineTo(cross, size.height);
    path.lineTo(0, cross);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
