import 'package:coching_app/model/lecture.dart';

class Sectionss {
 final String _name;
 final List<Lecture> _lecture;
 
  List<Lecture> get lecture => _lecture;
  String get name => _name;

  Sectionss(this._name,this._lecture);


}



