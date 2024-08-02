import 'package:coching_app/constantce.dart';
import 'package:coching_app/utils/route_name.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 450,
              width: 450,
              child: Image.asset('assets/images/introscreen/intro.png',)),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Grow your skills',
              style: TextStyle(color: Colors.grey.shade900, fontSize: 27),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Choose your course and leanguage',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.home);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                  child: Text(
                    'Getting Start',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
