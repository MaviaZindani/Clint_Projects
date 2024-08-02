import 'package:coching_app/model/course_category.dart';
import 'package:coching_app/model/section.dart';

class Course {
  final String _id;
  final String _title;
  final String _thumbnaiul;
  final String _discription;
  final String _createdBy;
  final String _createdDate;
  final double _rate;
  bool _isFavorite;
  final double _price;
  final CourseCategory _courseCategory;
  final String _duration;
  final int _lessonNo;
  final List<Sectionss> _section;

  Course(
    this._id,
    this._title,
    this._thumbnaiul,
    this._discription,
    this._createdBy,
    this._createdDate,
    this._rate,
    this._price,
    this._courseCategory,
    this._duration,
    this._lessonNo,
    this._section, 
    this._isFavorite
  );

  String get id => _id;
  String get title => _title;
  String get thumbnaiul => _thumbnaiul;
  String get discription => _discription;
  String get createdBy => _createdBy;
  String get createdDate => _createdDate;
  double get rate => _rate;
  bool get isFavorite => _isFavorite;
  double get price => _price;
  CourseCategory get courseCategory => _courseCategory;
  String get duration => _duration;
  int get lessonNo => _lessonNo;
  List<Sectionss> get section => _section;

  set isFavorite(bool value) {
    _isFavorite = value;
  }
 

}
