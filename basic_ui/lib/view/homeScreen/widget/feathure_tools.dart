import 'package:basic_ui/data%20provider/data_provider.dart';
import 'package:basic_ui/view/homeScreen/widget/feathure_tool_box.dart';
import 'package:flutter/material.dart';

class FeathureTools extends StatefulWidget {
  const FeathureTools({super.key});

  @override
  State<FeathureTools> createState() => _FeathureToolsState();
}

class _FeathureToolsState extends State<FeathureTools> {
  @override
  Widget build(BuildContext context) {
    final itemCount =
        DataProvider.toolname.length < DataProvider.toolimages.length
            ? DataProvider.toolname.length
            : DataProvider.toolimages.length;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Feathure tool',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return FeathureToolBox(
                    toolName: DataProvider.toolname[index],
                    toolimage: DataProvider.toolimages[index]);
              }),
        ),
      ],
    );
  }
}
