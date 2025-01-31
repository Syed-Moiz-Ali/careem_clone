import 'package:flutter/material.dart';

class SlidingContainerProvider with ChangeNotifier {
  bool _isContainerVisible = false;
  late AnimationController _controller;
  Animation<Offset>? _slideAnimation;

  bool get isContainerVisible => _isContainerVisible;
  Animation<Offset>? get slideAnimation => _slideAnimation;

  void setController(AnimationController controller) {
    _controller = controller;

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggleContainer() {
    _isContainerVisible = !_isContainerVisible;

    if (_isContainerVisible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    notifyListeners();
  }
}
