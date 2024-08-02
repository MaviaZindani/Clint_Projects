import 'package:coching_app/data%20provider/course_data_provide.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/model/course_category.dart';
import 'package:coching_app/notifier/change_category_notifier.dart';
import 'package:coching_app/view/home/widget/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseList extends StatelessWidget {
  CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: getcourselist(context).map((course) {
        return CourseItem(course: course);
      }).toList(),
    );
  }

  List<Course> getcourselist(BuildContext context) {
    var provider = Provider.of<CourseDataProvide>(context,listen: false);
    var category = Provider.of<CourseCategoryChangeNotifier>(context).category;
    if (category == CourseCategory.all) {
      return provider.courseList;
    }else{
    return provider.courseList.where((course) => course.courseCategory == category).toList();
    }
  }
}
