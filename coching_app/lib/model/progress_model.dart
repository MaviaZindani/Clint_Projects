

import 'package:coching_app/model/course.dart';

class ProgressModel {
  final Course _course;
  int _progress = 0;

  ProgressModel(this._course);

  int get progress => _progress;
  Course get course => _course;

  set progress(int value) {
    _progress = value;
  }
}