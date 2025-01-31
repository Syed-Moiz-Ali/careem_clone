import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget(text: 'Activities'),
      ),
    );
  }
}
