import 'package:careem/core/common/ads_widget.dart';
import 'package:careem/core/utils/app_list.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/common_widgets.dart';
import '../../../../core/common/offers_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/widgets/custom_image.dart';
import '../widgets/products_list.dart';
import 'groceriesByCategory/groceries_by_category_screen.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({super.key});

  // Helper method to generate offers items (horizontal scroll list)
  Widget _buildOffers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWidgets.sectionTitle('offers'),
        // const CustomGap(heightFactor: .01),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return const OffersWidget();
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    List groceriesList = AppList.groceriesList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const TextWidget(text: 'Categories', styleType: TextStyleType.heading),
        CommonWidgets.sectionTitle('Categories'),

        const CustomGap(heightFactor: .03),
        SizedBox(
          height: 80.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                // crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisExtent: 14.h,
                mainAxisSpacing: 0,
                maxCrossAxisExtent: 20.h),
            itemCount: groceriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var grocery = groceriesList[index];
              return GestureDetector(
                onTap: () {
                  NH.navigateTo(
                      const GroceriesByCategoryScreen(category: '{title}'));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    // color: AppColors.disabledColor,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CustomImageWidget(
                          height: 18.h,
                          width: 27.w, // Fixed height for the image
                          fit: BoxFit.contain,
                          imageUrl: grocery['src'],
                        ),
                      ),
                      // const SizedBox(
                      //     height: 8), // Add some spacing between image and text
                      // const TextWidget(text: 'categ'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Helper method to generate Product List section
  Widget _buildProductSection(String title) {
    return Column(
      children: [
        ProductList(
          title: title,
          products: AppList.products,
        ),
        const CustomGap(heightFactor: .04),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Groceries', automaticallyImplyLeading: true),
      body: groceryScreen(),
    );
  }

  SingleChildScrollView groceryScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdsWidget(),
          _buildOffers(),
          _buildGridView(),
          _buildProductSection('Our Pick'),
          _buildProductSection('Weekly Highlights'),
          _buildProductSection('Top Picks'),
          _buildProductSection('Bundle Offer'),
          _buildProductSection('Get Ready For Christmas'),
          const CustomGap(heightFactor: .06),
        ],
      ),
    );
  }
}
