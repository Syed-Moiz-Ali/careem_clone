import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/common_functions.dart';
import '../../../../core/common/module_widget.dart';
import '../../../../core/common/offers_widget.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/utils/app_list.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_gap.dart';
import '../../../../core/widgets/custom_icon.dart';
import '../../../../core/widgets/custom_textfiled.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../other/home_sevices/modules/saloon_spa/widgets/address_selection_bottom_sheet.dart';
import '../widgets/all_shops.dart';
import '../widgets/recommended_shops.dart';

class ShopsScreen extends StatelessWidget {
  const ShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modulesList = AppList.shopsModulesList;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Shops',
        centerTitle: false,
        appBarHeight: 22.h,
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Size(100.w, 5.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    CommonFunctions.customBottomSheet(
                      addPadding: false,
                      child: const AddressSelectionBottomSheet(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconWidget(
                        iconData: Icons.location_on_outlined,
                        size: 22.sp,
                      ),
                      const TextWidget(
                          text: 'Deliver to so', styleType: TextStyleType.body),
                    ],
                  ),
                ),
                const CustomGap(heightFactor: .02),
                CustomTextField(
                  controller: TextEditingController(),
                  labelText: 'Search Here',
                  radius: 40.w,
                  suffixIcon: CustomIconWidget(
                    iconData: Icons.search_rounded,
                    size: 24.sp,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _buildModules(modulesList),
          SliverToBoxAdapter(child: _buildOffers()),
          const SliverToBoxAdapter(child: RecommendedShops()),
          const SliverToBoxAdapter(child: AllShops()),
        ],
      ),
    );
  }

  Widget _buildModules(List modulesList) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 3 items per row
          crossAxisSpacing: 2.w, // Horizontal spacing between items
          mainAxisSpacing: 2.w, // Vertical spacing between items
          mainAxisExtent: 14.h),
      itemCount: modulesList.length, // Number of items in the list
      itemBuilder: (context, index) {
        var module = modulesList[index];
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
