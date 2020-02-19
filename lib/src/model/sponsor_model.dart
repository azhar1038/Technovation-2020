class SponsorModel{
  String _name;
  String _description;
  String _image;
  String _website;

  SponsorModel({String name, String description, String image, String website}){
    _name = name;
    _description = description;
    _image = image;
    _website = "http://"+website;
  }

  String get name => _name;
  String get image => _image;
  String get description => _description;
  String get website => _website;
}
