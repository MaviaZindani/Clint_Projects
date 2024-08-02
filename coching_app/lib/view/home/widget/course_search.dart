import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseSearch extends StatelessWidget {
  const CourseSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Search Course',
        hintStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.white,
        prefixIcon:const Padding(
          padding: EdgeInsets.only(right: 20,left: 12),
          child: Icon(Icons.search),),
        border:OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding:const EdgeInsets.fromLTRB(8, 8, 8, 8)
      ),
    );
  }
}
