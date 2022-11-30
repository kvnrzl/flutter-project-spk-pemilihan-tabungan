import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class SuccessPage extends StatelessWidget {
  final String message;
  const SuccessPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomText(
              text: "Perhatian!",
              size: 18,
              weight: FontWeight.bold,
              color: Colors.red,
            ),
            CustomText(text: message),
          ],
        ),
      ),
    );
  }
}
