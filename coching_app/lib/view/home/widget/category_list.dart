import 'package:coching_app/constantce.dart';
import 'package:coching_app/model/course_category.dart';
import 'package:coching_app/notifier/change_category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CourseCategoryChangeNotifier>(
      context,
    ).category;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Course category",
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
          height: 35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CourseCategory.values.length,
              itemBuilder: (context, index) {
                CourseCategory courseCategory = CourseCategory.values[index];
                return InkWell(
                  onTap: () {
                    Provider.of<CourseCategoryChangeNotifier>(context,
                            listen: false)
                        .changeCategory(courseCategory);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    // height: 10,
                    decoration: BoxDecoration(
                        color:category == courseCategory? kPrimaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 2,
                            style: BorderStyle.solid)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Center(child: Text(courseCategory.title)),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
