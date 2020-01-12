class TeamModel{
  String _name;
  String _post;
  String _image;

  TeamModel({String name, String post, String image}){
    _name = name;
    _post = post;
    _image = image;
  }

  String get name => _name;
  get post => _post;
  get image => _image;
}