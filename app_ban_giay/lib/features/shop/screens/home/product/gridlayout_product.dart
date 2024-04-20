import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class GridLayoutProduct extends StatelessWidget {
  const GridLayoutProduct({
    super.key, 
    required this.itemCount, 
    this.mainAxisExtent = 288, 
    required this.itemBuilder
  });


  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero, 
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: TSizes.girdViewSpacing,
        crossAxisSpacing: TSizes.girdViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}