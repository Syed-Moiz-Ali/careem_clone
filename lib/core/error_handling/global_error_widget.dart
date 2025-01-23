// core/error_handling/global_error_widget.dart
import 'package:flutter/material.dart';

class GlobalErrorWidget extends StatelessWidget {
  final String errorMessage;

  const GlobalErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage, style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
