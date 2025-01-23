import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_padding.dart';
import 'brands_card.dart';

class PopularBrandsSection extends StatelessWidget {
  const PopularBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(6, (index) {
            return const CustomPadding(
              horizontalFactor: .02,
              child: BrandsCard(),
            );
          }),
        ),
      ),
    );
  }
}
