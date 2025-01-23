import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomStaggeredgridWidget extends StatelessWidget {
  final List staggeredGridItems;

  const CustomStaggeredgridWidget(
      {super.key, required this.staggeredGridItems});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      crossAxisCount: 4,
      children: staggeredGridItems.map((item) {
        return StaggeredGridTile.extent(
          mainAxisExtent: item['mainAxisExtent'],
          crossAxisCellCount: item['crossAxisCellCount'],
          child: item['child'],
        );
      }).toList(),
    );
  }
}
