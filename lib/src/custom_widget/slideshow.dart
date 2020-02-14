import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/fancy_line_bloc.dart';
import 'package:technovation2020/src/model/event_model.dart';

class Slideshow extends StatefulWidget {
  final Function(EventModel) onImageClick;

  Slideshow({
    @required this.onImageClick,
  });

  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  List<Widget> images;
  List<EventModel> specialEvents = [
    EventModel.fromJson({
      "id": 300,
      "image": "000.jpg",
      "name": "Internet Mystery",
      "description":
          "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
      "rules": ["How to play rule 1", "How to play rule 2"],
      "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
      "coordinatorsNumber": ["9747897864", "6392785637"],
      "judgement": ["This is how you will get points"],
    }),
    EventModel.fromJson({
      "id": 0,
      "image": "000.jpg",
      "name": "Internet Mystery",
      "description":
      "This is an event to test the deciphering abilities of participants. Participants will need to solve some mind-boggling puzzles to get to the treasure. This event will be conducted in two phases.\n\nPhase1: It will be a pre-event. Participants will need to solve all the puzzles to know when and where phase 2 will be conducted.\n\nPhase 2: The final puzzle which will be provided on the spot.",
      "rules": [
        "Number of participants-1",
        "Full use of internet is allowed"
      ],
      "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
      "coordinatorsNumber": ["9747897864", "6392785637"],
      "judgement": [
        "The very first person to solve the puzzle will win the prize."
      ],
    }),
    EventModel.fromJson({
      "id": 101,
      "image": "101.jpg",
      "name": "Star Night",
      "description":
      "Come and Enjoy! We have a Special guest waiting to make your night a lifetime experience.",
      "rules": [],
      "coordinators": ["Prasant Kumar Dey", "Monalisha Sahoo"],
      "coordinatorsNumber": ["7789890440", "7788818623"],
      "judgement": []
    }),
    EventModel.fromJson({
      "id": 102,
      "image": "102.jpg",
      "name": "Spectacolo-di-Talenti",
      "description":
      "\"The entire world ‘s a stage\", they say. For the people who believe this , for the people with passion ans obsession, we have the right stage for you!. Be it comedy, mimicry, acting, magic, dance or any quirky thing you are passionately curious about, we have the stage ready for you!. Give the crowd and the judges the trime of their lives. ",
      "rules": [
        "Dance: It may be solo or duet or group performance having maximum 8 members.(Duration: 3-4 min)",
        "Song: Songs of any language may be sung. (Duration: 2-3 min)",
        "Instrumental:- All types of instruments are allowed.(Duration: 2-3 min)",
        "Act:- Mono act or skit can be performed. (Duration: 3-5 min)",
        "Band Performance"
      ],
      "coordinators": ["Prasant Kumar Dey", "Monalisha Sahoo"],
      "coordinatorsNumber": ["7789890440", "7788818623"],
      "judgement": []
    }),
    EventModel.fromJson({
      "id": 205,
      "image": "205.jpg",
      "name": "Lazer Maze",
      "description":
      "It is a real life heist style game where you dodge lasers and finish the track levels as quickly as possible without setting off the alarm.\n\nYou have to use your body balance and flexibility to reach the end of the room without touching the lasers.",
      "rules": [
      ],
      "coordinators": ["Nachiketa Dhal", "Smruti Swagatika Muduli"],
      "coordinatorsNumber": ["8328992036", "9556027382"],
      "judgement": []
    }),
  ];

  FancyLineBloc _fancyLineBloc;

  Widget getImage(String asset, int serial) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      child: CustomPaint(
        painter: _BorderPainter(
          border: Colors.white,
        ),
        child: GestureDetector(
          onTap: () => widget.onImageClick(specialEvents[serial]),
          child: Container(
            padding: EdgeInsets.zero,
            child: ClipPath(
              clipper: _BorderClipper(),
              child: Image.asset(
                'images/events/$asset',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    images = [
      getImage('event1.jpg', 0),
      getImage('000.jpg', 1),
      getImage('101.jpg', 2),
      getImage('102.jpg', 3),
      getImage('205.jpg', 4),
    ];
    _fancyLineBloc = FancyLineBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 6.2,
      child: Transform.scale(
        scale: 1.12,
        child: CarouselSlider(
          items: images,
          height: 200,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          pauseAutoPlayOnTouch: Duration(seconds: 2),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int i) {
            _fancyLineBloc.change(i);
          },
        ),
      ),
    );
  }
}

class _BorderPainter extends CustomPainter {
  Color border;

  _BorderPainter({
    @required this.border,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double diff = 10;

    var paint = Paint();
    paint.color = border;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var path = Path();
    path.moveTo(diff, 0);
    path.lineTo(0, diff);

    path.moveTo(2 * diff, 0);
    path.lineTo(0, 2 * diff);

    path.moveTo(3 * diff, 0);
    path.lineTo(0, 3 * diff);

    path.moveTo(4 * diff, 0);
    path.lineTo(0, 4 * diff);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 4 * diff, size.height);
    path.lineTo(size.width, size.height - 4 * diff);
    path.lineTo(size.width, 0);
    path.lineTo(4 * diff, 0);

    path.moveTo(size.width, size.height - 3 * diff);
    path.lineTo(size.width - 3 * diff, size.height);

    path.moveTo(size.width, size.height - 2 * diff);
    path.lineTo(size.width - 2 * diff, size.height);

    path.moveTo(size.width, size.height - diff);
    path.lineTo(size.width - diff, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _BorderClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    double diff = 10;
    path.moveTo(4 * diff, 0);
    path.lineTo(0, 4 * diff);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 4 * diff, size.height);
    path.lineTo(size.width, size.height - 4 * diff);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
