import 'package:flutter/material.dart';

class OverlappingSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget title;
  final TabBar tabBar;
  final bool needTabBar;

  OverlappingSliverAppBar({
    this.expandedHeight = 150,
    @required this.title,
    this.tabBar,
    this.needTabBar = false,
  }) : assert(!needTabBar || tabBar != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double top = expandedHeight - shrinkOffset-45;
    double opacity = 1 - shrinkOffset / (expandedHeight - 50);
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: title,
            ),
          ),
        ),
        needTabBar
            ? Positioned(
                top: top > 25 ? top : 25,
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
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
