import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/modules/other/home_sevices/modules/home_cleaning/home_cleaning_screen.dart';
import 'package:careem/modules/other/home_sevices/modules/laundry/laundry_screen.dart';
import 'package:careem/modules/other/home_sevices/modules/saloon_spa/saloon_spa_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/offers_widget.dart';
import '../../../../core/widgets/custom_staggeredgrid_widget.dart';
import '../widgets/home_service_module_card.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({super.key});

  @override
  Widget build(BuildContext context) {
    List staggeredGridHomeServicesList = [
      {
        "child": const HomeServiceModuleCard(
            title: 'Home Cleaning',
            subtitle: 'by our Top-rated professional',
            screen: HomeCleaningScreen()),
        "mainAxisExtent": 25.h,
        "crossAxisCellCount": 4,
      },
      {
        "child": const HomeServiceModuleCard(
            title: 'Salon & Spa',
            subtitle: 'Massages haircuts and much more',
            screen: SalonSpaScreen()),
        "mainAxisExtent": 25.h,
        "crossAxisCellCount": 2,
      },
      {
        "child": const HomeServiceModuleCard(
            title: 'Laundry',
            subtitle: 'clean your clothes shoes & bags ',
            screen: LaundryScreen()),
        "mainAxisExtent": 25.h,
        "crossAxisCellCount": 2,
      },
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home Services',
        styleType: TextStyleType.heading2,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPadding(
              allSidesFactor: .02,
              child: CustomStaggeredgridWidget(
                staggeredGridItems: staggeredGridHomeServicesList,
              ),
            ),
            CommonWidgets.subscribeCard(),
            CommonWidgets.sectionTitle('Offers',
                showIcon: false, fontSize: 14.sp),
            _buildOffers(),
          ],
        ),
      ),
    );
  }

  Widget _buildOffers() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {
          return const OffersWidget();
        }),
      ),
    );
  }
}
