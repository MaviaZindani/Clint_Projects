import 'dart:async';

import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  int _selectPromo = 0;

  List<Image> widgetList = [
    Image.network(
        'https://foundr.com/wp-content/uploads/2021/09/Best-online-course-platforms.png'),
    Image.network(
        'https://foundr.com/wp-content/uploads/2021/09/Best-online-course-platforms.png'),
    Image.network(
        'https://foundr.com/wp-content/uploads/2021/09/Best-online-course-platforms.png'),
  ];

  final PageController controller = PageController();

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_selectPromo < 2) {
        _selectPromo++;
      } else {
        _selectPromo = 0;
      }

      if (controller.positions.isNotEmpty) {
        controller.animateToPage(_selectPromo,
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        PageView.builder(
          controller: controller,
          onPageChanged: (int selectedpage) {
            setState(() {
              _selectPromo = selectedpage;
            });
          },
          itemCount: widgetList.length,
          itemBuilder: (context, index) {
            return widgetList[index];
          },
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < widgetList.length; index++)
                if (index == _selectPromo) ...[createCircle(true)] else
                  createCircle(false)
            ],
          ),
        ),
      ]),
    );
  }
}

Widget createCircle(bool isCurrent) {
  return AnimatedContainer(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    duration: const Duration(microseconds: 150),
    height: isCurrent ? 12 : 8,
    width: isCurrent ? 12 : 8,
    decoration: BoxDecoration(
      color: isCurrent ? Colors.orange : Colors.grey,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}