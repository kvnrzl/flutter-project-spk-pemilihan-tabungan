import 'package:flutter/material.dart';

class DropDownPreferenceItem extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const DropDownPreferenceItem({
    super.key,
    required this.controller,
    required this.label,
  });

  final List<DropdownMenuItem> items = const [
    DropdownMenuItem(
      value: "1",
      child: Text("1"),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text("2"),
    ),
    DropdownMenuItem(
      value: "3",
      child: Text("3"),
    ),
    DropdownMenuItem(
      value: "4",
      child: Text("4"),
    ),
    DropdownMenuItem(
      value: "5",
      child: Text("5"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      // height: size.height / 8,
      // width: size.width,
      child: DropdownButtonFormField(
        items: items,
        // value: itemValue.text,
        onSaved: (value) {
          controller.text = value;
        },
        onChanged: (value) {
          controller.text = value;
        },
        decoration: InputDecoration(
          label: Text(label),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
