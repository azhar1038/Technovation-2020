import 'package:flutter/material.dart';

class BeveledButton extends StatelessWidget {
  final Icon icon;
  final Widget text;
  final VoidCallback onTap;

  BeveledButton({
    @required this.icon,
    @required this.text,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff005bea),
            Color(0xff00a6fb),
          ],
          stops: [0, 0.8],
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                icon,
                SizedBox(height: 8),
                text,
              ],
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
