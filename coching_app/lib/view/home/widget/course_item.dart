import 'package:coching_app/argument/course_argument.dart';
import 'package:coching_app/constantce.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/utils/route_name.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context, 
                RouteName.courseDetails,
                arguments: CourseArgument(course)
                );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(course.thumbnaiul),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: kBlueColor,
                            size: 22,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            course.createdBy,
                            style: const TextStyle(
                                fontSize: 11, color: kBlueColor),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: kRatingColor,
                                size: 22,
                              ),
                              Text(
                                '${course.rate}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Text(
                            '\$${course.price}',
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
