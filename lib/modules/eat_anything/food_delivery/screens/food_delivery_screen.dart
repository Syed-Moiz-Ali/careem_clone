import 'package:careem/core/common/ads_widget.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/common_widgets.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/brands_list.dart';
import '../widgets/category_grid.dart';
import '../widgets/restaurants_list.dart';

class FoodDeliveryScreen extends StatelessWidget {
  const FoodDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Food Delivery',
        automaticallyImplyLeading: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Column(
              children: [
                AdsWidget(),
                CustomGap(heightFactor: .03),
                // CategoryGridSection(),
              ],
            ),
          ),
          const CategoryGridSection(),
          const RestaurantsListSection(
            title: 'NearBy',
            cardType: RestaurantsCardType.nearBy,
          ),
          const SliverToBoxAdapter(
            child: CustomGap(heightFactor: .02),
          ),
          SliverToBoxAdapter(
            child: CommonWidgets.sectionTitle('Popular Brands'),
          ),
          const PopularBrandsSection(),
          const RestaurantsListSection(
            title: 'All Restaurants',
            cardType: RestaurantsCardType.allRestaurants,
          ),
        ],
      ),
    );
  }
}
