import 'package:coching_app/data%20provider/course_data_provide.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/view/home/widget/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeatherCourse extends StatelessWidget {
  const FeatherCourse({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CourseDataProvide>(context,listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feather Course",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: provider.courseList.length,
              itemBuilder: (context, index) {
                Course course = provider.courseList[index];
                return CourseItem(course: course);
              }),
        )
      ],
    );
  }
}
