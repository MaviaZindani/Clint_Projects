import 'package:flutter/material.dart';

class MonitorSectionBox extends StatelessWidget {
  final String monitorScreenname;
  final String monitorScreen;

  MonitorSectionBox({
    super.key,
    required this.monitorScreen,
    required this.monitorScreenname,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.3)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.notification_add),
                    const SizedBox(width: 8),
                    Text(monitorScreenname),
                  ],
                ),
                const InkWell(child: Icon(Icons.menu_outlined)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
            child: Image.asset(
              monitorScreen,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
