import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/text_widget.dart';

class LaundryScreen extends StatelessWidget {
  const LaundryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          title: 'Laundry', centerTitle: true, automaticallyImplyLeading: true),
      body: Center(
        child: TextWidget(text: 'LaundryScreen'),
      ),
    );
  }
}
