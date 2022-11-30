import 'package:flutter/material.dart';

class FormAddItem extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;

  const FormAddItem({
    Key? key,
    required this.controller,
    required this.label,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      // height: size.height / 8,
      width: size.width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hint ?? label,
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
