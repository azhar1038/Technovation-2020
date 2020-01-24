import 'package:technovation2020/src/model/sponsor_model.dart';

class SponsorProvider{
  List<SponsorModel> _sponsors;

  SponsorProvider(){
    _sponsors = [
      SponsorModel(
        name: 'Richard\'s Spa & Salon',
        image: 'richard.jpg',
        website: 'm.facebook.com/richardsspa',
      ),
      SponsorModel(
        name: 'Interface Software',
        image: 'interface.png',
        website: 'infaso.in',
      ),
      SponsorModel(
        name: 'Green Trends',
        image: 'greentrends.png',
        website: 'm.facebook.com/Green-Trends-105047224242474',
      ),
      SponsorModel(
        name: 'Lakshya Institute of Technology',
        image: 'lit.jpg',
        website: 'litindia.in',
      ),
      SponsorModel(
        name: 'Java Technocrat',
        image: 'jt.png',
        website: 'javatechnocrat.com',
      ),
      SponsorModel(
        name: 'National Aluminium Company Ltd.',
        image: 'nalco.jpg',
        website: 'nalcoindia.com',
      ),
      SponsorModel(
        name: 'National Thermal Power Corporation Ltd.',
        image: 'ntpc.png',
        website: 'ntpc.co.in',
      ),
      SponsorModel(
        name: 'Samal Care',
        image: 'samalcare.jpg',
        website: 'm.facebook.com/SAMAL-CARE-Hospital-1933696440187852',
      ),
      SponsorModel(
        name: 'B21 Salon & Spa',
        image: 'b21.png',
        website: 'b21india.com',
      ),
      SponsorModel(
        name: 'Ink Stories',
        image: 'inkstories.png',
        website: 'm.facebook.com/theinkstories',
      ),
      SponsorModel(
        name: 'BOCCA Cafe',
        image: 'bocca.png',
        website: 'm.facebook.com/BoccaCafeBBSR',
      ),
      SponsorModel(
        name: 'Khalo-Ji',
        image: 'khaloji.png',
        website: 'm.facebook.com/khalojirestrocafe',
      ),
      SponsorModel(
        name: 'The Cricket\'s Cafe',
        image: 'cricketscafe.jpg',
        website: 'm.facebook.com/thecricketscafe',
      ),
      SponsorModel(
        name: 'Modi Collection',
        image: 'modi.jpg',
        website: 'm.facebook.com/modicollectionangul',
      ),
      SponsorModel(
        name: 'Studio 11',
        image: 'studio11.png',
        website: 'studio11.co',
      ),
      SponsorModel(
        name: 'Cineplexx',
        image: 'cineplexx.png',
        website: 'cineplexx.in',
      ),
    ];
  }

  List<SponsorModel> get sponsors => _sponsors;
}