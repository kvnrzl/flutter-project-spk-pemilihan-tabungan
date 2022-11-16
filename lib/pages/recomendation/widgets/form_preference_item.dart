import 'package:flutter/material.dart';

class FormPreferenceItem extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const FormPreferenceItem({
    Key? key,
    required this.controller,
    required this.label,
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
          hintText: label == "Bisnis"
              ? "1 - 5"
              : label == "Investasi"
                  ? "1 - 5"
                  : label == "Transaksional"
                      ? "1 - 5"
                      : label == "Dewasa"
                          ? "1 - 5"
                          : label == "Remaja"
                              ? "1 - 5"
                              : label == "Anak-anak"
                                  ? "1 - 5"
                                  : label,
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
