import 'package:flutter/material.dart';

class NotchedSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget background;
  final TabBar tabBar;
  final double minHeight;

  NotchedSliverAppBar({
    this.expandedHeight = 150,
    @required this.background,
    this.tabBar,
    this.minHeight = 64,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double top = expandedHeight - shrinkOffset - 45;
    double opacity = 1 - shrinkOffset / (expandedHeight - minHeight);
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: expandedHeight - 25,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff122c3d),
                Color(0xff16407c),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Opacity(
            opacity: opacity >= 0 ? opacity : 0,
            child:background
          ),
        ),
        tabBar != null
            ? Positioned(
                top: top,
                left: (MediaQuery.of(context).size.width - 250) / 2,
                child: Card(
                  elevation: 6,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff1d57a1),
                          Color(0xff1d77c1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: tabBar,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
