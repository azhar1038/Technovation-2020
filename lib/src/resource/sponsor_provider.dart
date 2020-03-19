import 'package:technovation2020/src/model/sponsor_model.dart';

class SponsorProvider{
  List<SponsorModel> _sponsors;

  SponsorProvider(){
    _sponsors = [
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
        name: 'Tata Consultancy Services',
        image: 'tcs.jpg',
        website: 'tcs.com',
      ),
      SponsorModel(
        name: 'Bharat Petroleum',
        image: 'bharat.png',
        website: 'bharatpetroleum.com',
      ),
      SponsorModel(
        name: 'Java Technocrat',
        image: 'jt.png',
        website: 'javatechnocrat.com',
      ),
      SponsorModel(
        name: 'Lakshya Institute of Technology',
        image: 'lit.jpg',
        website: 'litindia.in',
      ),
      SponsorModel(
        name: 'Interface Software',
        image: 'interface.png',
        website: 'infaso.in',
      ),
      SponsorModel(
        name: 'Punjab National Bank',
        image: 'pnb.jpg',
        website: 'pnbindia.in',
      ),
      SponsorModel(
        name: 'Surya Garden',
        image: 'surya.jpg',
        website: 'suryagarden.com',
      ),
      SponsorModel(
        name: 'Salaam Namaste',
        image: 'salaam.png',
        website: 'm.facebook.com/Salaam-Namaste-Restaurant-293393481081643',
      ),
      SponsorModel(
        name: 'Richard\'s Spa & Salon',
        image: 'richard.jpg',
        website: 'm.facebook.com/richardsspa',
      ),
      SponsorModel(
        name: 'Naturals',
        image: 'naturals.jpg',
        website: 'naturals.in',
      ),
      SponsorModel(
        name: 'Green Trends',
        image: 'greentrends.png',
        website: 'm.facebook.com/Green-Trends-105047224242474',
      ),
      SponsorModel(
        name: 'Ink Stories',
        image: 'inkstories.png',
        website: 'm.facebook.com/theinkstories',
      ),
      SponsorModel(
        name: 'Studio 11',
        image: 'studio11.png',
        website: 'studio11.co',
      ),
      SponsorModel(
        name: 'Teeshood',
        image: 'teeshood.jpg',
        website: 'teeshood.com/en/',
      ),
      SponsorModel(
        name: 'Tiaamo',
        image: 'tiaamo.jpg',
        website: 'tiaamo.com',
      ),
      SponsorModel(
        name: 'Sixit Sports',
        image: 'sixit.png',
        website: 'sixitsports.com',
      ),
      SponsorModel(
        name: 'Career Launcher',
        image: 'career.jpg',
        website: 'careerlauncher.com',
      ),
      SponsorModel(
        name: 'Weirdo',
        image: 'a.png',
        website: 'google.com',
      ),
    ];
  }

  List<SponsorModel> get sponsors => _sponsors;
}
