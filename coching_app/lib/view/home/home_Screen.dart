import 'package:coching_app/componetent/Shopping_cart_option.dart';
import 'package:coching_app/componetent/bottom_option.dart';
import 'package:coching_app/constantce.dart';
import 'package:coching_app/view/home/widget/category_course_list.dart';
import 'package:coching_app/view/home/widget/course_search.dart';
import 'package:coching_app/view/home/widget/feather_course.dart';
import 'package:coching_app/view/home/widget/header.dart';
import 'package:coching_app/view/home/widget/offers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Column(
          children: [
            Container(
              height: 170,
              decoration:const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Header(),
                    CourseSearch(),
                  ],
                ),
              )),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8.0),
           child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Offers(),
              ),
              const SizedBox(height: 10,),
              const FeatherCourse(),
              const CategoryCourseList()
            ],
           ),
         )
         ],
        )),
      ),
      floatingActionButton: ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomOption(selectIndex: 1,),
    );
  }
}