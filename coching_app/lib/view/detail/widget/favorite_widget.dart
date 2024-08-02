import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/data%20provider/course_data_provide.dart'; // Adjust import based on your file structure

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key, required this.course});
  final Course course;

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool myisFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myisFavorite = widget.course.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
       setState(() {
        myisFavorite = !myisFavorite;
        widget.course.isFavorite = myisFavorite;
       });
       print(myisFavorite);
      }, 
      icon: Icon(
        myisFavorite?
        Icons.favorite:
        Icons.favorite_border,
        color: Colors.red,)
      );
  }
}
