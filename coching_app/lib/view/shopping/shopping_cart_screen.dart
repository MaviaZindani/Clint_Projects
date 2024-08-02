import 'package:coching_app/argument/chackout_argument.dart';
import 'package:coching_app/constantce.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/utils/route_name.dart';
import 'package:coching_app/view/chackout_view/chackout_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data provider/course_data_provide.dart';

class ShoppingCartScreen extends StatefulWidget {
   ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CourseDataProvide>(context,listen: false);
    double totelamount = calculateTotel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping cart'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children:[ Column(
                    children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Totel:',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${totelamount}',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
                  height: 20,
                ),
            Align(
              alignment:Alignment.topLeft,
              child: Text(
                'Promotion code',
                style: TextStyle(
                    color: Colors.grey.shade900, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Promo Code',
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {}, 
                  child:const Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                    ),)
                  ),
              ],
            ),
            Text(
              "${provider.courseList.length} Choose Course's",
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: provider.shoppingCartCourseList.length,
                  itemBuilder: (context, index) {
                    return createShoppingCartIyem(index);
                  }),
            )
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize:const Size(double.maxFinite, 50),
                      minimumSize: const Size(double.maxFinite, 45),
                      backgroundColor: kBlueColor
                    ),
                    onPressed: (){
                      Navigator.pushNamed(
                        context,
                        RouteName.chackoutView,
                        arguments: ChackoutArgument(provider.shoppingCartCourseList, totelamount));
                    }, 
                  child: const Text('Chack out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),))
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotel() {
    var provider = Provider.of<CourseDataProvide>(context,listen: false);
    return provider.shoppingCartCourseList
        .fold(0, (old, course) => old + course.price);
  }

  Widget createShoppingCartIyem(int index) {
    var provider = Provider.of<CourseDataProvide>(context,listen: true);
    Course course = provider.shoppingCartCourseList[index];
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.network(course.thumbnaiul),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade800,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'By ${course.createdBy}',
              style: const TextStyle(
                color: kBlueColor,
                fontSize: 12,
              ),
            ),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${course.lessonNo} Lesson',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          children: [
            Text(
              '${course.price}PRK',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  provider.deletCourse(course);
                });
              },
              child: const Icon(Icons.delete,size: 18,),
            ),
          ],
        ),
      ),
    );
  }
}
