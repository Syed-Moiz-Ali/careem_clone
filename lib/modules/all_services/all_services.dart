import 'package:careem/modules/get_anything/shop/shops_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/common/common_widgets.dart';
import '../../core/common/module_widget.dart';
import '../../core/common/offers_widget.dart';
import '../../core/constants/images_constant.dart';
import '../../core/enums/app_enums.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/custom_padding.dart';
import '../eat_anything/dineout/screens/dine_out_screen.dart';
import '../eat_anything/food_delivery/screens/food_delivery_screen.dart';
import '../get_anything/box/screens/box_delivery.dart';
import '../get_anything/groceries/screens/groceries_screen.dart';
import '../other/home_sevices/screens/home_services.dart';

class AllServices extends StatelessWidget {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    Map servicesList = {
      'Go anywhere': [
        {"title": "Rides", "icon": ModulesImages.ridesIcon},
        {"title": "Car Rental", "icon": ModulesImages.carRentalIcon},
        {"title": "Bike", "icon": ModulesImages.bikeIcon},
        {"title": "Scool Rides", "icon": ModulesImages.schoolRidesIcon},
        {"title": "City to City", "icon": ModulesImages.cityToCityIcon},
      ],
      'Eat anything': [
        {
          "title": "Food",
          "icon": ModulesImages.foodIcon,
          "screen": const FoodDeliveryScreen()
        },
        {
          "title": "DineOut",
          "icon": ModulesImages.dineOutIcon,
          "screen": const DineOutScreen()
        },
      ],
      'Get anything': [
        {
          "title": "Groceies",
          "icon": ModulesImages.groceriesIcon,
          "screen": const GroceriesScreen()
        },
        {
          "title": "Shops",
          "icon": ModulesImages.shopsIcon,
          "screen": const ShopsScreen()
        },
        {
          "title": "Box",
          "icon": ModulesImages.boxIcon,
          "screen": const BoxDelivery()
        },
        {"title": "Pharmacy", "icon": ModulesImages.pharmacyIcon},
      ],
      'Pay anyone': [
        {
          "title": "Bills & Recharges",
          "icon": ModulesImages.billsAndRechargesIcon
        },
      ],
      'Other': [
        {
          "title": "Home Services",
          "icon": ModulesImages.homeServicesIcon,
          "screen": const HomeServices()
        },
      ],
    };
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'All Services',
        automaticallyImplyLeading: true,
      ),
      body: _buildServiceSection(servicesList),
    );
  }

  _buildServiceSection(Map servicesList) {
    return SingleChildScrollView(
      child: Column(
        children: servicesList.entries.map(
          (e) {
            var key = e.key.toString();
            var list = List.from(e.value);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.sectionTitle(
                  key,
                  fontSize: 15.sp,
                  showIcon: false,
                  styleType: TextStyleType.heading,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 17.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        var data = list[index];
                        return CustomPadding(
                          horizontalFactor: .02,
                          verticalFactor: .01,
                          child: ModuleWidget(
                            module: data,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
