import 'package:flutter/material.dart';

class SlidingContainerProvider with ChangeNotifier {
  bool _isContainerVisible = false;
  late AnimationController _controller;
  Animation<Offset>? _slideAnimation;

  bool get isContainerVisible => _isContainerVisible;
  Animation<Offset>? get slideAnimation => _slideAnimation;

  // Initialize the AnimationController and setup the sliding animation
  void setController(AnimationController controller) {
    _controller = controller;

    // Default animation: slide from top to bottom
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -2), // Start off-screen (top)
      end: Offset.zero, // End at its normal position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  // Toggle visibility with the new logic
  void toggleContainer() {
    _isContainerVisible = !_isContainerVisible;

    if (_isContainerVisible) {
      // When showing, use the original Tween (top to bottom)
      // _slideAnimation = Tween<Offset>(
      //   begin: const Offset(0, -1), // Start off-screen (top)
      //   end: Offset.zero, // End at its normal position
      // ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller.forward(); // Show the container (slide from top to bottom)
    } else {
      // When hiding, reverse the Tween (bottom to top)
      // _slideAnimation = Tween<Offset>(
      //   begin: Offset.zero, // Start at the normal position
      //   end: const Offset(0, 1), // End off-screen (bottom)
      // ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _controller.reverse(); // Hide the container (slide from bottom to top)
    }

    notifyListeners();
  }
}
