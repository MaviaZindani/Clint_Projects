import 'package:basic_ui/data%20provider/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Hader extends StatefulWidget {
  const Hader({super.key});

  @override
  State<Hader> createState() => _HaderState();
}

class _HaderState extends State<Hader> {
  @override
  Widget build(BuildContext context) {
    String? myname;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flex(direction: Axis.vertical, children: [
              DropdownButton<String>(
                value: myname,
                onChanged: (value) {
                  setState(() {
                    myname = value;
                  });
                  if (kDebugMode) {
                    print('chalgaya');
                  }
                },
                items: DataProvider.countrysName
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ]),
            Flex(direction: Axis.vertical, children: [
              DropdownButton<String>(
                value: myname,
                onChanged: (value) {
                  setState(() {
                    myname = value;
                  });
                  if (kDebugMode) {
                    print('chalgaya');
                  }
                },
                items: DataProvider.countrysName
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
