import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/custom_text.dart';

class NewCustomTextDetail extends StatelessWidget {
  final String text;
  const NewCustomTextDetail({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomText(
        text: text,
      ),
    );
  }
}
