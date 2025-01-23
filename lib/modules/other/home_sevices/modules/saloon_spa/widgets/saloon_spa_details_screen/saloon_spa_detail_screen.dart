import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../core/widgets/custom_appbar.dart';
import '../../../../../../../core/widgets/custom_gap.dart';
import '../../../../../../../core/widgets/custom_padding.dart';
import '../../../../../../../core/widgets/primary_button.dart';
import '../../../../../../../core/widgets/text_widget.dart';
import '../chips_section.dart';
import 'widgets/add_ons.dart';
import 'widgets/checkout.dart';
import 'widgets/date_time_selection.dart';
import 'widgets/service_list_section.dart';
import 'widgets/top_section.dart';

class SalonSpaDetailScreen extends StatefulWidget {
  const SalonSpaDetailScreen({super.key, required this.title});

  final String title;

  @override
  State<SalonSpaDetailScreen> createState() => _SalonSpaDetailScreenState();
}

class _SalonSpaDetailScreenState extends State<SalonSpaDetailScreen> {
  int progressIndex = 0;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressSection() {
    return Expanded(
      child: progressIndex == 0
          ? ServiceListSection(scrollController: _scrollController)
          : progressIndex == 1
              ? const AddOns()
              : progressIndex == 2
                  ? const DateTimeSelection()
                  : const Checkout(),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      height: 12.h,
      decoration: const BoxDecoration(color: AppColors.backgroundColorLight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTotalAmount(),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildTotalAmount() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(text: 'Total', styleType: TextStyleType.body),
        TextWidget(text: 'AED 0.00', styleType: TextStyleType.heading2),
      ],
    );
  }

  Widget _buildNextButton() {
    return PrimaryButton(
      onTap: () {
        setState(() {
          progressIndex++;
        });
      },
      text: progressIndex >= 3 ? 'Complete' : 'Next',
      width: .4,
      bgColor: AppColors.primaryColor,
      textColor: AppColors.backgroundColorDark,
      fontWeight: FontWeight.bold,
      borderRadius: 100.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: progressIndex == 0 ? true : false,
      onPopInvoked: (didPop) {
        log(didPop.toString());
        if (progressIndex > 0) {
          setState(() {
            progressIndex--;
          });
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.title,
          centerTitle: true,
          styleType: TextStyleType.heading2,
          automaticallyImplyLeading: true,
        ),
        body: CustomPadding(
          horizontalFactor: .02,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSection(progressIndex: progressIndex),
              if (progressIndex == 0)
                ChipsSection(scrollController: _scrollController),
              const CustomGap(heightFactor: .02),
              _buildProgressSection(),
              _buildBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
