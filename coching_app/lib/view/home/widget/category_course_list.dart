import 'package:coching_app/notifier/change_category_notifier.dart';
import 'package:coching_app/view/home/widget/category_list.dart';
import 'package:coching_app/view/home/widget/course_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCourseList extends StatelessWidget {
  const CategoryCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CourseCategoryChangeNotifier(),
    child: Column(
      children: [
        const SizedBox(height: 10,),
        CategoryList(),
        const SizedBox(height: 10,),
        CourseList(),
      ],
    ),);
  }
}