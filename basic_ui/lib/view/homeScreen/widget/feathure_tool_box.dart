import 'package:flutter/material.dart';

class FeathureToolBox extends StatelessWidget {
  String toolName = '';
  String toolimage = '';

  FeathureToolBox({super.key, required this.toolName, required this.toolimage});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 70,vertical: 90),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: Image.asset(toolimage)),
            const SizedBox(
              height: 10,
            ),
            Text(toolName),
          ],
        ),
      ),
    );
  }
}
