import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableBuilderHelper {
  Widget builder({
    required ValueListenable valueListenable,
    required Widget Function(dynamic) builder,
  }) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, _) {
        return builder(value); // Pass the updated value to the child function
      },
    );
  }
}
