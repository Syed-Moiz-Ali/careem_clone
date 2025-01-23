import 'package:careem/core/common/ads_widget.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/custom_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_list.dart';
import '../../../../../core/widgets/custom_gap.dart';
import '../../widgets/products_list.dart';

class GroceriesByCategoryScreen extends StatelessWidget {
  const GroceriesByCategoryScreen({super.key, required this.category});

  final String category;

  Widget _buildProductSection(String title) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomPadding(horizontalFactor: .03, child: AdsWidget()),
          ProductList(
            title: title,
            products: AppList.products,
            isScrollable: false,
            showHeader: false,
          ),
          const CustomGap(heightFactor: .04),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: category,
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            const CustomTabBar(
              tabs: [
                "All",
                "Vegetables",
                "Fruits",
                "Herbs",
                "Cut Fruits & Vegetables",
              ],
            ),
            Expanded(
              child: TabBarView(
                // controller: _tabController,
                children: [
                  // Center(child: Text("All Items")),
                  _buildProductSection("All Items"),
                  const Center(child: Text("Vegetables")),
                  const Center(child: Text("Fruits")),
                  const Center(child: Text("Herbs")),
                  const Center(child: Text("Cut Fruits & Vegetables")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
