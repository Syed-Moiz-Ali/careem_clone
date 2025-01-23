import 'package:careem/core/common/module_widget.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/common/common_widgets.dart';
import '../../core/constants/images_constant.dart';
import '../../core/enums/app_enums.dart';

class AllServices extends StatelessWidget {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'All Services',
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildServiceSection('Go anywhere'),
            _buildServiceSection('Eat anything'),
            _buildServiceSection('Get anything'),
            _buildServiceSection('Pay anyone'),
            _buildServiceSection('Other'),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWidgets.sectionTitle(
          title,
          fontSize: 15.sp,
          showIcon: false,
          styleType: TextStyleType.heading,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 17.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CustomPadding(
                  horizontalFactor: .02,
                  verticalFactor: .01,
                  child: ModuleWidget(
                    module: {
                      'title': 'Rides',
                      'icon': ModulesImages.ridesIcon,
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
