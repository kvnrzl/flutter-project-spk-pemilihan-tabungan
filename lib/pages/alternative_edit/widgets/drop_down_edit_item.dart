import 'package:flutter/material.dart';

class DropDownEditItem extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem> items;
  final TextEditingController itemValue;
  const DropDownEditItem(
      {super.key,
      required this.items,
      required this.itemValue,
      required this.label});

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
          itemValue.text = value;
        },
        onChanged: (value) {
          itemValue.text = value;
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
            return 'Please enter some value';
          }
          return null;
        },
      ),
    );
  }
}
