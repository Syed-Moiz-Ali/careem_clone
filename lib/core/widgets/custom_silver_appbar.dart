import 'package:careem/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSilverAppbar extends StatelessWidget {
  final Widget title;
  final Widget background;
  final double expandedHeight;
  final bool floating;
  final bool pinned;

  const CustomSilverAppbar({
    super.key,
    required this.title,
    this.expandedHeight = 200.0,
    this.floating = true,
    this.pinned = true,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundColorLight,
      expandedHeight: expandedHeight,
      floating: floating,
      // title: title,
      pinned: pinned,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: title,
        background: background,
        expandedTitleScale: 2.0,
      ),
    );
  }
}
