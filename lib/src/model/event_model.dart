class EventModel{
  int _id;
  String _image;
  String _name;
  String _description;
  List<dynamic> _rules;
  List<dynamic> _coordinators;
  List<dynamic> _coordinatorsNumber;
  List<dynamic> _judgement;
  String _location;
  int _day;
  String _time;

  EventModel.fromJson(Map<String, dynamic> details, Map<String, dynamic> time){
    _id = details['id'];
   _image = details['image'];
   _name = details['name'];
   _description = details['description'];
   _rules = details['rules'];
   _coordinators = details['coordinators'];
   _coordinatorsNumber = details['coordinatorsNumber'];
   _judgement = details['judgement'];
   _location = details['location'];
   _day = time['day'];
   _time = time['time'];
  }

  get id => _id;
  get image => _image;
  get name => _name;
  get description => _description;
  get rules => _rules;
  get coordinators => _coordinators;
  get coordinatorsNumber => _coordinatorsNumber;
  get judgement => _judgement;
  get location => _location;
  get day => _day;
  get time => _time;

  String toString(){
    String s ='';
    print("id : $_id");
    print("image: $_image");
    print("name: $_name");
    print("description: $_description");
    print("rules: ${_rules.toString()}");
    print("coordinators: ${_coordinators.toString()}");
    print("coordinatorsNumber: ${_coordinatorsNumber.toString()}");
    print("judgement: ${_judgement.toList()}");
    print("location: $_location");
    print("day: $_day");
    print("time: $_time");
    return s;
  }
}