import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String message;
  const SuccessPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
