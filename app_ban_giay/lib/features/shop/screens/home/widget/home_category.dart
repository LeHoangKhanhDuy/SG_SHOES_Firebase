import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key, required this.cateHome, required this.selected,
  });

  final String cateHome;
  final bool selected;
  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 80,
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: 8,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (_, index){
  //         return VerticalImageText(image: TImages.adidasIcon, title: 'Adidas', onTap: () => Get.to(() => const SubCategoriesScreen()));
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          cateHome,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: selected ? TColors.white : const Color(0xFF9D8F8F) ,
          ),        
        ),
      ),
    );
  }
}
