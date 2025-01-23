// ignore_for_file: library_private_types_in_public_api

import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/common/module_widget.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/utils/app_list.dart';
import 'package:careem/core/utils/provider_util/provider_helper.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/common/ads_widget.dart';
import '../../core/common/offers_widget.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/custom_icon.dart';
import '../../core/widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _modulesList = AppList.modulesList;

  // Helper method to generate module items (e.g., Cab, Food, Grocery, etc.)
  // Widget _buildModules() {
  //   return Wrap(
  //     spacing: 7, // Horizontal spacing between items
  //     runSpacing: 7, // Vertical spacing between items
  //     children: List.generate(_modulesList.length, (index) {
  //       var module = _modulesList[index];
  //       return InkWell(
  //         overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
  //         onTap: () {
  //           if (module['screen'] != null) {
  //             NH.navigateTo(module['screen']);
  //           }
  //         },
  //         child: ModuleWidget(module: module),
  //       );
  //     }),
  //   );
  // }
  Widget _buildModules() {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 items per row
        crossAxisSpacing: 7, // Horizontal spacing between items
        mainAxisSpacing: 7, // Vertical spacing between items
      ),
      itemCount: _modulesList.length, // Number of items in the list
      itemBuilder: (context, index) {
        var module = _modulesList[index];
        return InkWell(
          overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
          onTap: () {
            if (module['screen'] != null) {
              NH.navigateTo(module['screen']);
            }
          },
          child: ModuleWidget(module: module),
        );
      },
    );
  }

  // Helper method to generate offers items (horizontal scroll list)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 80,
        title: '',
        prefixIcon: PrimaryButton(
          onTap: () {},
          text: 'Pay',
          width: .2,
          height: .05,
          borderRadius: 100.w,
        ),
        actions: [
          CustomPadding(
            horizontalFactor: .03,
            child: PrimaryButton(
              onTap: () {
                ProviderHelper.read
                    .slidingContainerProvider()
                    .toggleContainer();
              },
              width: .136,
              borderRadius: 100.w,
              child: const CustomIconWidget(
                iconData: Icons.menu_rounded,
              ),
            ),
          ),
        ],
      ),
      body: CustomPadding(
        horizontalFactor: .03, // Consistent horizontal padding
        child: CustomScrollView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          slivers: [
            // SliverToBoxAdapter(child: CommonWidgets.sectionTitle('Modules')),
            _buildModules(),
            const SliverToBoxAdapter(child: AdsWidget()),
            SliverToBoxAdapter(child: CommonWidgets.sectionTitle('Offers')),
            SliverToBoxAdapter(child: _buildOffers()),
            const SliverToBoxAdapter(child: AdsWidget()),
          ],
        ),
      ),
    );
  }
}
