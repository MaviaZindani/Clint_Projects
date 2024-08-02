import 'package:basic_ui/data%20provider/data_provider.dart';
import 'package:basic_ui/view/homeScreen/widget/monitor_section_box.dart';
import 'package:flutter/material.dart';

class MonitorSection extends StatefulWidget {
  const MonitorSection({super.key});

  @override
  State<MonitorSection> createState() => _MonitorSectionState();
}

class _MonitorSectionState extends State<MonitorSection> {
  @override
  Widget build(BuildContext context) {
    final itemCount =
        DataProvider.toolname.length < DataProvider.toolimages.length
            ? DataProvider.toolname.length
            : DataProvider.toolimages.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Monitor Section',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.arrow_circle_right_outlined)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        SizedBox(
          width: double.minPositive,
          height: double.minPositive,
          child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(12),
                  child: MonitorSectionBox(
                      monitorScreen: DataProvider.monitorSectionImage[index],
                      monitorScreenname: DataProvider.monitorSectionName[index]
                      ),
                );
              }
            ),
        ),
      ],
    );
  }
}
