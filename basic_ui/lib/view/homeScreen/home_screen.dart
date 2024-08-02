import 'package:basic_ui/view/homeScreen/widget/feathure_tools.dart';
import 'package:basic_ui/view/homeScreen/widget/hader.dart';
import 'package:basic_ui/view/homeScreen/widget/monitor_section.dart';
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
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Hader(),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/HomeScreen/IRVINEI-logo-HD.png'),
            ),
            const FeathureTools(),
            const SizedBox(
              height: 20,
            ),
             MonitorSection(),
          ],
        ),
      )
    );
  }
}