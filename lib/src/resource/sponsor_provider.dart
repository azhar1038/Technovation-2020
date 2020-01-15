import 'package:technovation2020/src/model/sponsor_model.dart';

class SponsorProvider{
  List<SponsorModel> _sponsors;

  SponsorProvider(){
    _sponsors = [
      SponsorModel(
        name: 'Google India',
        description: 'Well... Google is Google.',
        image: 'sponsor1.png',
        website: 'google.co.in',
      ),
      SponsorModel(
        name: 'Amazon web Services',
        description: 'A subsidiary of Amazon.com, Amazon Web Services is a provider of on demand cloud-computing platforms. It has been web partner with many eminent organisations and one of them is TiE.',
        image: 'sponsor2.png',
        website: 'aws.amazon.com',
      ),
      SponsorModel(
        name: 'Ernst & Young',
        description: 'EY is known for sponsoring and partnering with events and conferences ranging from Entrepreneurship, Healthcare and many more.',
        image: 'sponsor3.png',
        website: 'ey.com',
      ),
      SponsorModel(
        name: 'Deloitte',
        description: 'Deloitte sponsors events ranging from real estate, technology to business',
        image: 'sponsor4.png',
        website: 'deloitte.com',
      ),
      SponsorModel(
        name: 'Chase',
        description: 'Chase assists clients with philanthropic interests who are looking to give back to their communities, foster a charitable legacy and make a difference in the world',
        image: 'sponsor5.png',
        website: 'chase.com',
      ),
    ];
  }

  List<SponsorModel> get sponsors => _sponsors;
}