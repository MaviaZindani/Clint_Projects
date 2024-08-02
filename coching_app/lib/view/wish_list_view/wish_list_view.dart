import 'package:coching_app/componetent/Shopping_cart_option.dart';
import 'package:coching_app/componetent/bottom_option.dart';
import 'package:coching_app/constantce.dart';
import 'package:coching_app/data%20provider/course_data_provide.dart';
import 'package:coching_app/model/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(
                'Wish List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Consumer<CourseDataProvide>(
                builder: (context, provider, child) {
                  final likedCourses = getLikeCourses(context);
                  return ListView.builder(
                    itemCount: likedCourses.length,
                    itemBuilder: (context, index) {
                      final likeCourse = likedCourses[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(likeCourse.thumbnaiul),
                          title: Text(
                            likeCourse.title,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'By ${likeCourse.createdBy}',
                                style: TextStyle(
                                  color: kBlueColor,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Colors.grey.shade500,
                                  ),
                                  Text(
                                    likeCourse.duration,
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Colors.grey.shade500,
                                  ),
                                  Text(
                                    '${likeCourse.lessonNo} Lessons',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Colors.grey.shade500,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amber.shade400),
                                      Text(
                                        '${likeCourse.rate}',
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$${likeCourse.price}',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                       likeCourse.isFavorite = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.grey.shade400,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    floatingActionButton: const ShoppingCartOption(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomOption(selectIndex: 3),
  );
}
List<Course> getLikeCourses(context){
    var provider = Provider.of<CourseDataProvide>(context,listen: false);
    return provider.courseList.where((course) => course.isFavorite).toList();
}
}
