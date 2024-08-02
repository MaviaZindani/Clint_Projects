import 'package:coching_app/model/course.dart';

class ChackoutArgument {
  final List<Course> _courseList;
  final double _totelprice;

  ChackoutArgument(this._courseList, this._totelprice);
  double get totelPrice => _totelprice;
  List<Course> get course => _courseList;

}