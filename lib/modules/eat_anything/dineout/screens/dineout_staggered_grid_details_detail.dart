import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/app_enums.dart';
import '../../food_delivery/widgets/restaurants_list.dart';

class DineOutStaggeredGridDetailsDetail extends StatelessWidget {
  final String title;
  const DineOutStaggeredGridDetailsDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title, automaticallyImplyLeading: true),
      body: const SingleChildScrollView(
        child: RestaurantsList(
          cardType: RestaurantsCardType.dineout,
        ),
      ),
    );
  }
}
