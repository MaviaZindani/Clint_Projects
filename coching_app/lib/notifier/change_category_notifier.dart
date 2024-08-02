import 'package:coching_app/model/course_category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CourseCategoryChangeNotifier extends ChangeNotifier {
  CourseCategory _category = CourseCategory.all;
  CourseCategory get category => _category;

  void changeCategory(CourseCategory category) {
    _category = category;
    notifyListeners();
  }
}
