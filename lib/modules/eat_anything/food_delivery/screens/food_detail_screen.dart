// ignore_for_file: library_private_types_in_public_api

import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/widgets/custom_gap.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key});

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCategory(int index) {
    double position = 0;
    switch (index) {
      case 0:
        position = 0;
        break;
      case 1:
        position = 300; // Adjust this value based on your layout
        break;
      case 2:
        position = 600; // Adjust this value based on your layout
        break;
      case 3:
        position = 900; // Adjust this value based on your layout
        break;
    }
    _scrollController.animateTo(position,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageWidget(
            imageUrl: '',
            height: 30.h,
            width: 100.w,
          ),
          const FoodDetailHeader(),
          const CustomPadding(
            horizontalFactor: .02,
            verticalFactor: .02,
            child: FoodDetailInfo(),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Best Sellers'),
              Tab(text: 'Offers Items'),
              Tab(text: 'Value Meals'),
              Tab(text: 'Sweets'),
            ],
            onTap: _scrollToCategory,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                      height: 300,
                      color: Colors.red,
                      child: const Center(child: Text('Best Sellers'))),
                  Container(
                      height: 300,
                      color: Colors.green,
                      child: const Center(child: Text('Offers Items'))),
                  Container(
                      height: 300,
                      color: Colors.blue,
                      child: const Center(child: Text('Value Meals'))),
                  Container(
                      height: 300,
                      color: Colors.yellow,
                      child: const Center(child: Text('Sweets'))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodDetailHeader extends StatelessWidget {
  const FoodDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Allo Beirut, Al Wasi',
              styleType: TextStyleType.heading,
            ),
            CustomGap(
              heightFactor: .01,
            ),
            TextWidget(
              text: 'Lebanise, Arabian',
              color: AppColors.disabledColor,
            ),
          ],
        ),
        CustomIconWidget(
          iconData: Icons.call,
          size: 30,
        ),
      ],
    );
  }
}

class FoodDetailInfo extends StatelessWidget {
  const FoodDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoColumn(
          title: '4.7',
          subtitle: '999+ Ratings',
        ),
        InfoColumn(
          title: '100',
          subtitle: 'Price',
        ),
        InfoColumn(
          title: '30-40 min',
          subtitle: 'Delivery Time',
        ),
        InfoColumn(
          title: '50',
          subtitle: 'Delivery Fee',
        ),
      ],
    );
  }
}

class InfoColumn extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoColumn({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: title,
          // styleType: TextStyleType.subheading,
          fontWeight: FontWeight.w700,
        ),
        const CustomGap(heightFactor: .005),
        TextWidget(
          text: subtitle,
          color: AppColors.disabledColor,
        ),
      ],
    );
  }
}
