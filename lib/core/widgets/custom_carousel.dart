import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../global/global.dart';
import 'shimmer.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> items;
  final double viewportFraction;
  final bool showDotIndicator;
  final double? height;

  const CustomCarousel({
    super.key,
    required this.items,
    this.viewportFraction = 1,
    this.showDotIndicator = false,
    this.height,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = widget.height ?? Aio.size.height * 0.25;

    return widget.items.isEmpty
        ? ShimmerWidgets.carouselShimmer() // Show shimmer if items are empty
        : Column(
            children: [
              SizedBox(
                height: height,
                width: Aio.size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: widget.viewportFraction,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: widget.items.map((i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12), child: i),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                  height: 10), // Reduced space between carousel and dots
              if (widget.showDotIndicator) _buildDotIndicator(),
            ],
          );
  }

  // Build the dot indicator with dynamic width based on the number of items
  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.items.length, (index) {
        // Calculate the width of each dot based on the number of items
        double dotWidth = Aio.size.width /
            widget.items.length *
            .7; // 30% of the width for each dot

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: dotWidth, // Dynamic width based on item count
          height: 5, // Fixed height for dots
          decoration: BoxDecoration(
            color: _currentIndex == index
                ? Aio.theme.colorScheme.primary
                : AppColors.disabledColor,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }).toList(),
    );
  }
}
