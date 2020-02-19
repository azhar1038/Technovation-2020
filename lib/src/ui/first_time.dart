import 'package:flutter/material.dart';
import 'package:technovation2020/src/ui/tabs.dart';

class FirstTime extends StatefulWidget {
  @override
  _FirstTimeState createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> {
  int _current;
  List<_FirstTimeItem> _intro;
  PageController _controller;

  void _previousPage() {
    if (_current > 0) {
      _current--;
      _controller.previousPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    }
  }

  void _nextPage() {
    if (_current < _intro.length - 1) {
      _current++;
      _controller.nextPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Tabs(),
        ),
      );
    }
  }

  @override
  void initState() {
    _current = 0;
    _controller = PageController(
      initialPage: 0,
      keepPage: false,
    );
    _intro = [
      _FirstTimeItem(
        image: 'intro0',
        header: 'Home',
        body: 'Here you can see our Major events.',
      ),
      _FirstTimeItem(
        image: 'intro1',
        header: 'Events',
        body: 'List of all events sorted according to day or category.',
      ),
      _FirstTimeItem(
        image: 'intro2',
        header: 'Event Details',
        body: 'Click on any event to know it\'s details or search any event.',
      ),
      _FirstTimeItem(
        image: 'intro3',
        header: 'Notification',
        body: 'Here you can see all the notifications or any announcement.',
      ),
      _FirstTimeItem(
        image: 'intro4',
        header: 'About',
        body: 'Wanna know who we are? Check it out.',
      ),
//      _FirstTimeItem(
//        image: 'intro5',
//        header: 'Helpline',
//        body: 'Just tap to call any event coordinator for further enquiry.',
//      ),
//      _FirstTimeItem(
//        image: 'intro6',
//        header: 'Notification',
//        body: 'Here you can see all the notifications about any announcement.',
//      ),
//      _FirstTimeItem(
//        image: 'intro7',
//        header: 'About',
//        body: 'Wanna know who we are? Check it out.',
//      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageView(
            controller: _controller,
            onPageChanged: (i){
              setState(() {
                _current = i;
              });
            },
            children: _intro,
          ),
          Positioned(
            top: 32,
            right: 24,
            child: FlatButton(
              color: Colors.white12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('SKIP'),
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Tabs(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _current != 0
                    ? Container(
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: _previousPage,
                        ),
                      )
                    : Container(width: 50),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_intro.length, (int i) {
                    return Container(
                      height: 8,
                      width: 8,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == i ? Colors.white : Colors.white54,
                      ),
                    );
                  }),
                ),
                Container(
                  width: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: _nextPage,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FirstTimeItem extends StatelessWidget {
  final String image;
  final String header;
  final String body;

  _FirstTimeItem({
    this.image,
    this.header,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32),
            alignment: Alignment.center,
            child: Image.asset(
              'images/intro/$image.jpg',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              header,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
