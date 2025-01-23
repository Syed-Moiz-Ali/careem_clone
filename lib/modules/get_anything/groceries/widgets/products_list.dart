import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common/common_product_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../screens/groceriesByCategory/groceries_by_category_screen.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.title,
    required this.products,
    this.isScrollable = true, // Default is scrollable
    this.itemsPerRow = 1,
    this.showHeader = true, // Default is one item per row
  });

  final bool isScrollable; // New parameter for controlling scrollable behavior
  final int
      itemsPerRow; // New parameter for controlling items in a row (for Wrap layout)

  final List<Map<String, dynamic>> products;
  final bool showHeader; // New parameter for controlling scrollable behavior
  final String title;

  /// Builds a horizontally scrollable Row
  Widget _buildScrollableRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((product) {
          return CommonProductWidget(
            // title: product['title'],
            // price: product['price'],
            // oldPrice: product['oldPrice'],
            // discount: product['discount'],
            // imagePath: product['imagePath'],
            product: product,
          );
        }).toList(),
      ),
    );
  }

  /// Builds a Wrap layout with a specified number of items per row
  Widget _buildWrap() {
    return Wrap(
      spacing: 8.0, // Space between items horizontally
      runSpacing: 8.0, // Space between items vertically
      children: products.map((product) {
        return SizedBox(
          width: 48.w, // Calculate width dynamically
          child: CommonProductWidget(
            product: product,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader) ...[
          CommonWidgets.sectionTitle(title, onTap: () {
            NH.navigateTo(GroceriesByCategoryScreen(category: title));
          }),
        ],
        const CustomGap(heightFactor: .02),
        isScrollable ? _buildScrollableRow() : _buildWrap(),
      ],
    );
  }
}
