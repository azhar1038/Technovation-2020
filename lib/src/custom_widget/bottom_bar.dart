import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/notification_bloc.dart';

const double ICON_OFF = -3;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1.5;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 300;
const Color COLOR = Colors.white;

NotificationBloc notificationBloc = NotificationBloc();

class BottomBar extends StatefulWidget {
  final Function(int) onItemPressed;

  BottomBar({@required this.onItemPressed});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  AnimationController _animationController;
  Tween<double> _positionTween;
  Animation<double> _positionAnimation;

  AnimationController _fadeOutController;
  Animation<double> _fadeFabOutAnimation;
  Animation<double> _fadeFabInAnimation;

  double fabIconAlpha = 1;
  IconData nextIcon = Icons.home;
  IconData activeIcon = Icons.home;

  int currentSelected = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: ANIM_DURATION));
    _fadeOutController = AnimationController(
        vsync: this, duration: Duration(milliseconds: (ANIM_DURATION ~/ 5)));

    _positionTween = Tween<double>(begin: -1, end: -1);
    _positionAnimation = _positionTween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            activeIcon = nextIcon;
          });
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.8, 1, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 55,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff16406c),
                Color(0xff122c3d),
              ],
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TabItem(
                selected: currentSelected == 0,
                iconData: Icons.home,
                title: "Home",
                callbackFunction: () {
                  widget.onItemPressed(0);
                  setState(() {
                    nextIcon = Icons.home;
                    currentSelected = 0;
                  });
                  _initAnimationAndStart(_positionAnimation.value, -1);
                },
              ),
              TabItem(
                selected: currentSelected == 1,
                iconData: Icons.event_note,
                title: "Events",
                callbackFunction: () {
                  widget.onItemPressed(1);
                  setState(() {
                    nextIcon = Icons.event_note;
                    currentSelected = 1;
                  });
                  _initAnimationAndStart(_positionAnimation.value, -0.33);
                },
              ),
              TabItem(
                isNotification: true,
                selected: currentSelected == 2,
                iconData: Icons.notifications_none,
                title: "Notification",
                callbackFunction: () {
                  widget.onItemPressed(2);
                  setState(() {
                    nextIcon = Icons.notifications_none;
                    currentSelected = 2;
                  });
                  _initAnimationAndStart(_positionAnimation.value, 0.33);
                },
              ),
              TabItem(
                selected: currentSelected == 3,
                iconData: Icons.subject,
                title: "About",
                callbackFunction: () {
                  widget.onItemPressed(3);
                  setState(() {
                    nextIcon = Icons.subject;
                    currentSelected = 3;
                  });
                  _initAnimationAndStart(_positionAnimation.value, 1);
                },
              ),
            ],
          ),
        ),
        IgnorePointer(
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Align(
                heightFactor: 0,
                alignment: Alignment(_positionAnimation.value, 1),
                child: FractionallySizedBox(
                  widthFactor: 1 / 4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                        width: 90,
                        child: Center(
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: ShapeDecoration(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: COLOR,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Opacity(
                              opacity: fabIconAlpha,
                              child: Icon(
                                activeIcon,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }
}

class TabItem extends StatefulWidget {
  TabItem({
    @required this.selected,
    @required this.iconData,
    @required this.title,
    @required this.callbackFunction,
    this.isNotification = false,
  });

  final String title;
  final IconData iconData;
  final bool selected, isNotification;
  final Function callbackFunction;

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  double iconYAlign = ICON_ON;
  double textYAlign = TEXT_OFF;
  double iconAlpha = ALPHA_ON;

  @override
  void initState() {
    super.initState();
    _setIconTextAlpha();
  }

  @override
  void didUpdateWidget(TabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setIconTextAlpha();
  }

  _setIconTextAlpha() {
    setState(() {
      iconYAlign = (widget.selected) ? ICON_OFF : ICON_ON;
      textYAlign = (widget.selected) ? TEXT_ON : TEXT_OFF;
      iconAlpha = (widget.selected) ? ALPHA_OFF : ALPHA_ON;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: AnimatedAlign(
                duration: Duration(milliseconds: ANIM_DURATION),
                alignment: Alignment(0, textYAlign),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontFamily: 'IMFellGreatPrimerSC',
                      color: COLOR,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                )),
          ),
          Container(
            child: AnimatedAlign(
              duration: Duration(milliseconds: ANIM_DURATION),
              curve: Curves.easeIn,
              alignment: Alignment(0, iconYAlign),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: ANIM_DURATION),
                opacity: iconAlpha,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  alignment: Alignment(0, 0),
                  icon: Stack(
                    children: <Widget>[
                      Icon(
                        widget.iconData,
                        color: COLOR,
                      ),
                      widget.isNotification
                          ? StreamBuilder<bool>(
                              stream: notificationBloc.notificationStream,
                              initialData: false,
                              builder: (context, snapshot) {
                                if (snapshot.data)
                                  return Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  );
                                else
                                  return Container(
                                    height: 0,
                                    width: 0,
                                  );
                              },
                            )
                          : Container(height: 0, width: 0),
                    ],
                  ),
                  onPressed: () {
                    widget.callbackFunction();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
