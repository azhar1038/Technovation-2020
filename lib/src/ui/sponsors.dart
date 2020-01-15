import 'package:flutter/material.dart';
import 'package:technovation2020/src/model/sponsor_model.dart';
import 'package:technovation2020/src/resource/intent.dart';
import 'package:technovation2020/src/resource/sponsor_provider.dart';

class Sponsors extends StatelessWidget {
  final List<SponsorModel> sponsors = SponsorProvider().sponsors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Sponsors',
          style: Theme.of(context).textTheme.title,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: sponsors.length,
        itemBuilder: (context, i) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              decoration: ShapeDecoration(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                color: Colors.white24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Image.asset(
                      'images/${sponsors[i].image}',
                      height: 64,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    sponsors[i].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Text(
                    sponsors[i].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 24),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: OutlineButton(
                      child: Text('Know More...'),
                      highlightedBorderColor: Colors.white,
                      onPressed: ()=>IntentHelper.web(sponsors[i].website),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
