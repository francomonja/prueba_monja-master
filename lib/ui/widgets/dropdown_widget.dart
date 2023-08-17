import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({Key? key, required this.onChanged}) : super(key: key);

  final Function onChanged;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

List<String> list = <String>['all', '10%', '20%', '30%', '40%'];

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        widget.onChanged(value);
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
