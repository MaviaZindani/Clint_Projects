import 'package:coching_app/constantce.dart';
import 'package:coching_app/utils/route_name.dart';
import 'package:flutter/material.dart';

class BottomOption extends StatefulWidget {
  BottomOption({super.key, required this.selectIndex});
  
  final int selectIndex;

  @override
  State<BottomOption> createState() => _BottomOptionState();
}

class _BottomOptionState extends State<BottomOption> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape:const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 1));
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home,color: getSelectedColor(1),),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(1)),
                    ),
                  ],
                ),
              ),
            ),
        
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 2));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.class_,color: getSelectedColor(2)),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'My Classes',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(2)),
                    ),
                  ],
                ),
              ),
            ),
        
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 3));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.list,color: getSelectedColor(3)),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      'Wish List',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(3)),
                    ),
                  ],
                ),
              ),
            ),
        
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, openScreen(context, 4));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person,color: getSelectedColor(4)),
                    SizedBox(
                      height: 1,
                    ),
                    Text('Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: getSelectedColor(4)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getSelectedColor(int optionIndex) {
    return (widget.selectIndex == optionIndex) ? kPrimaryColor : Colors.grey.shade800;
  }

   openScreen(BuildContext context,int selectOption){
    String routeName = RouteName.home;
    switch (selectOption) {
      case 1:
        routeName = RouteName.home;
        break;
      case 2:
        routeName = RouteName.myCourseView;
        break;
      case 3:
        routeName = RouteName.wishListView;
      default:
    } 
    return routeName;
  }
}
