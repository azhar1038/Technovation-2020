import 'package:flutter/material.dart';
import 'package:technovation2020/src/model/event_model.dart';

class EventsSearchDelegate extends SearchDelegate<EventModel> {
  final List<EventModel> events;

  EventsSearchDelegate({
    @required this.events,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      brightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      primaryColor: Color(0xff16406c),
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    String lQuery = query.toLowerCase();
    final results = events.where((event) => event.name.toLowerCase().contains(lQuery));
    return ListView(
      children: results
          .map<ListTile>(
            (event) => ListTile(
              title: Text(event.name),
              onTap: ()=>close(context, event),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    String lQuery = query.toLowerCase();
    final results = events.where((event) => event.name.toLowerCase().contains(lQuery));
    return ListView(
      children: results
          .map<ListTile>(
            (event) => ListTile(
              title: Text(event.name),
              onTap: ()=>close(context, event),
            ),
          )
          .toList(),
    );
  }
}
