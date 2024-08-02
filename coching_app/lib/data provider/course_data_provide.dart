import 'package:coching_app/model/course.dart';
import 'package:coching_app/model/course_category.dart';
import 'package:coching_app/model/lecture.dart';
import 'package:coching_app/model/progress_model.dart';
import 'package:coching_app/model/section.dart';
import 'package:flutter/material.dart';


class CourseDataProvide extends ChangeNotifier{

   addCourse(Course course) {
    _shoppingCartCourseList.add(course);
    notifyListeners();
  }

   addAllCourse(List<Course> courses) {
    _shoppingCartCourseList.addAll(courses);
     notifyListeners();
  }

   clearCart() {
    _shoppingCartCourseList.clear();
     notifyListeners();
  }

   deletCourse(Course course) {
    _shoppingCartCourseList.remove(course);
     notifyListeners();
  }

     addInMyList(List<Course> checkOutList) {
      for (var element in checkOutList) {
       ProgressModel crouseWithProgess = ProgressModel(element);
     _myCourse.add(crouseWithProgess);
      }
    notifyListeners();
  }

  bool likeCourse(Course course , bool like){
   return course.isFavorite = like;
  }
  
  static List<Sectionss> _sectionList = [
    Sectionss("Introduction",[
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
    ]),
    Sectionss("Introduction",[
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
    ],),
   Sectionss("Introduction",[
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
    ],),
   Sectionss("Introduction",[
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
    ],),
   Sectionss("Introduction",[
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
      Lecture("what is flutter","10:00 min"),
    ],),
  ];
  static List<Course> _coursesList = [ 

    Course(
    '1',
    'flutter Master Class', 
    'https://www.shutterstock.com/image-vector/3d-web-vector-illustrations-online-600nw-2152289507.jpg',
    'This complete flutter course beginner to export',
    'Effort less course',
    '01-jan-2022',
     4.2,
    450,
    CourseCategory.finance,
    '2.5 hours',
     15,
     _sectionList,
     false
     ),
    Course(
    "2",
    "flutter Master Class",
    'https://www.shutterstock.com/image-vector/3d-web-vector-illustrations-online-600nw-2152289507.jpg',
    'This complete flutter course beginner to export',
    'Effort less course',
    '01-jan-2022',
    4.2,
    450,
    CourseCategory.marketing,
    '2.5 hours',
    15,
    _sectionList,
    false
    ),
    Course(
    "2",
    "flutter Master Class",
    'https://www.shutterstock.com/image-vector/3d-web-vector-illustrations-online-600nw-2152289507.jpg',
    'This complete flutter course beginner to export',
    'Effort less course',
    '01-jan-2022',
    4.2,
    450,
    CourseCategory.other,
    '2.5 hours',
    15,
    _sectionList,
    false
    ),
    Course(
    "4",
    "flutter Master Class",
    'https://www.shutterstock.com/image-vector/3d-web-vector-illustrations-online-600nw-2152289507.jpg',
    'This complete flutter course beginner to export',
    'Effort less course',
    '01-jan-2022',
    4.2,
    450,
    CourseCategory.programming,
    '2.5 hours',
    15,
    _sectionList,
    false
    ),
    Course(
    "5",
    "flutter Master Class",
    'https://www.shutterstock.com/image-vector/3d-web-vector-illustrations-online-600nw-2152289507.jpg',
    'This complete flutter course beginner to export',
    'Effort less course',
    '01-jan-2022',
    4.2,
    450,
    CourseCategory.all,
    '2.5 hours',
    15,
    _sectionList,
    false
    ),
  ];

  static final List<Course> _shoppingCartCourseList = [
     Course(
    '1',
    'flutter Master Class', 
    'https://www.shutterstock.com/image-vector/3d-web-vector-illustrations-online-600nw-2152289507.jpg',
    'This complete flutter course beginner to export',
    'Effort less course',
    '01-jan-2022',
     4.2,
    450,
    CourseCategory.finance,
    '2.5 hours',
     15,
     _sectionList,
     false
     ),
  ];

  static final List<ProgressModel> _myCourse =[];

  List<Course> get courseList => _coursesList;
  List<ProgressModel> get myCourse => _myCourse;
  List<Sectionss> get sectionList => _sectionList;
  List<Course> get shoppingCartCourseList => _shoppingCartCourseList; 

}