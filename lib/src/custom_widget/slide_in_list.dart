import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/list_bloc.dart';

class SlideInList extends StatefulWidget {
  final Duration duration, delay;
  final List<Widget> children;

  SlideInList({
    Key key,
    this.duration,
    this.delay,
    this.children,
  })  : assert(duration >= delay),
        super(key: key);

  @override
  _SlideInListState createState() => _SlideInListState();
}

class _SlideInListState extends State<SlideInList> {
  ListBloc _listBloc;

  @override
  void initState() {
    super.initState();
    _listBloc = ListBloc();
  }

  @override
  Widget build(BuildContext context) {
    _listBloc.startAnimation(widget.children.length, widget.delay);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.children.length,
        itemBuilder: (context, int index) {
          return _SlideListItem(
            child: widget.children[index],
            duration: widget.duration,
            position: index,
            listBloc: _listBloc,
          );
        },
      ),
    );
  }
}

class _SlideListItem extends StatefulWidget {
  final int position;
  final Widget child;
  final Duration duration;
  final ListBloc listBloc;

  _SlideListItem({
    this.position,
    this.child,
    this.duration,
    this.listBloc,
  });

  @override
  _SlideListItemState createState() => _SlideListItemState();
}

class _SlideListItemState extends State<_SlideListItem>
    with SingleTickerProviderStateMixin {
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

    _offsetFloat = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _opacity = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.listBloc.listStream,
      initialData: -1,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.data >= widget.position && snapshot.data > -1)
          _controller.forward();
        return SlideTransition(
          position: _offsetFloat,
          child: FadeTransition(
            opacity: _opacity,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
