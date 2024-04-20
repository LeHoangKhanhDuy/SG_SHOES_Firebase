
import 'package:app_ban_giay/features/shop/screens/all_product.dart/all_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/gridlayout_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/product_card_vertical.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/home_appbar.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/home_category.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/primary_header_container.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            //HeaderContainer
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const HomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Searchbar
                  // SearchContainer(text: 'Tìm sản phẩm'),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.search_normal),
                        hintText: 'Tìm sản phẩm',
                        hintStyle: TextStyle(color: TColors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: TColors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: TColors.white),
                        ),                     
                      ),
                      style: TextStyle(color: TColors.white),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // //Category
                  // Padding(
                  //   padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  //   child: Column(
                  //     children: [

                  //       //Heading
                  //       SectionHeading(title: 'Danh mục sản phẩm', showActionButton: false, textColor: Colors.white),
                  //       SizedBox(height: TSizes.spaceBtwSections),

                  //       //Category
                  //       HomeCategory(),

                  //     ],
                  //   ),
                  // ),

                  // SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        HomeCategory(cateHome: 'Nike', selected: false),
                        HomeCategory(cateHome: 'Adidas', selected: true),
                        HomeCategory(cateHome: 'Puma', selected: false),
                        HomeCategory(cateHome: 'New Balance', selected: false),
                        HomeCategory(cateHome: 'Converse', selected: false),
                      ],
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),

            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),         
              child: Column(
                children: [
                  // //Slide image
                  // const TSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4]),
                  // const SizedBox(height: TSizes.spaceBtwSections,),

                  //Heading
                  SectionHeading(title: 'Sản phẩm phổ biến', onPressed: () => Get.to(() => const AllProduct())),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  //SanPham
                  GridLayoutProduct(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),           
                ],
              ),
            ),            
          ],
        ),
      ),
    );
  }
}

















