import 'package:coching_app/componetent/Shopping_cart_option.dart';
import 'package:coching_app/componetent/bottom_option.dart';
import 'package:coching_app/constantce.dart';
import 'package:coching_app/data%20provider/course_data_provide.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/model/progress_model.dart';
import 'package:coching_app/view/shopping/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CourseDataProvide>(context,listen: false);
    if (provider.myCourse.isNotEmpty) {
      provider.myCourse[0].progress = 50;
      provider.myCourse[1].progress = 70;
    }
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'My Course List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 30,
                width: double.maxFinite,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade900)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'All Course\'s',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade900)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Download Course\'s',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade900)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Archived Course\'s',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder
              (itemCount: provider.myCourse.length,
                itemBuilder: (context,index){
                  ProgressModel course = provider.myCourse[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(course.course.thumbnaiul),
                      title: Text(course.course.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.shade800,
                      ),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(course.course.createdBy,
                          style: TextStyle(
                            color: Colors.grey.shade500
                          ),),
                          const SizedBox(height: 10,),
                          Visibility(
                            visible: course.progress > 0,
                            replacement: Text('Start Course',
                          style: TextStyle(
                            color: kBlueColor,
                            fontWeight: FontWeight.bold,
                          ),),
                            child: Row(
                              children: [
                                Expanded(child: 
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(trackHeight: 3,thumbColor: Colors.transparent,overlayShape: SliderComponentShape.noThumb,thumbShape: SliderComponentShape.noThumb),
                                  child: Slider(
                                    min: 0,
                                    max: 100,
                                    value: course.progress.toDouble(), 
                                    onChanged: (val){}
                                    ),
                                ),
                                ),
                                const SizedBox(width: 10,),
                                Text('${course.progress}%'),
                              ],
                            ),),
                          
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: const ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomOption(selectIndex: 2),
    );
  }
}
