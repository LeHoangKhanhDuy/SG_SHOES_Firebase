
import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/common/widgets/appbar/tabbar.dart';
import 'package:app_ban_giay/common/widgets/brand/brand_card.dart';
import 'package:app_ban_giay/common/widgets/icons/cart_menu_icon.dart';
import 'package:app_ban_giay/features/shop/screens/home/product/gridlayout_product.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/search_container.dart';
import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
import 'package:app_ban_giay/features/shop/screens/store/widget/category_tab.dart';
import 'package:app_ban_giay/features/shop/screens/sub_category/sub_categories.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Cửa hàng', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartIcon(onPressed: (){}),
          ],
        ),   
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return[
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 440,
      
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
      
                      //Search
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const SearchContainer(text: 'Tìm sản phẩm', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),
      
                      //Brand
                      SectionHeading(title: 'Danh mục', showActionButton: true, onPressed: () => Get.to(() => const SubCategoriesScreen()),),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      
                      GridLayoutProduct(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                        return const TBrandCard(showBorder: true,);
                      })
                    ],
                  ),
                ),
      
                //Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Nike')),
                    Tab(child: Text('Adidas')),
                    Tab(child: Text('Puma')),
                    Tab(child: Text('New Balance')),
                    Tab(child: Text('Converse')),
                  ],
                ),
              ),
            ];
          }, 
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),   
      ),
    );
  }
}









// class StoreScreen extends StatelessWidget {
//   const StoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: const [
//           StoreAppBar(),
//           SearchContainer(
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//             text: 'Tìm sản phẩm',
//             showBorder: true,
//             showBackground: false,
//           ),
//           SizedBox(height: TSizes.spaceBtwSections),
//           CategoryProduct(),

//           StoreProduct(),
//         ],
//       ),
//     );
//   }
// }





//appBar: TAppBar(
        //   title: Text('Cửa hàng',
        //       style: Theme.of(context).textTheme.headlineMedium),
        //   actions: [
        //     CartIcon(onPressed: () {}),
        //   ],
        // ),



// body: NestedScrollView(
//           headerSliverBuilder: (_, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 pinned: true,
//                 floating: true,
//                 backgroundColor: THelperFunctions.isDarkMode(context)
//                     ? TColors.black
//                     : TColors.white,
//                 expandedHeight: 440,

//                 //Brand cate
//                 flexibleSpace: Padding(
//                   padding: const EdgeInsets.all(TSizes.defaultSpace),
//                   child: ListView(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     children: [
//                       //Search
//                       const SizedBox(height: TSizes.spaceBtwItems),
//                       const SearchContainer(
//                           text: 'Tìm sản phẩm',
//                           showBorder: true,
//                           showBackground: false,
//                           padding: EdgeInsets.zero),
//                       const SizedBox(height: TSizes.spaceBtwSections),

//                       //Hãng giày
//                       SectionHeading(title: 'Hãng giày', onPressed: () {}),
//                       const SizedBox(height: TSizes.spaceBtwItems / 1.5),

//                       //
//                       GridLayoutProduct(
//                         itemCount: 4,
//                         mainAxisExtent: 80,
//                         itemBuilder: (_, index) {
//                           return const BrandCard(showBorder: false);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 //Tabs
//                 // bottom: const TTabBar(
//                 //   tabs: [
//                 //     Tab(child: Text('Sports')),
//                 //     Tab(child: Text('Sports')),
//                 //     Tab(child: Text('Sports')),
//                 //     Tab(child: Text('Sports')),
//                 //     Tab(child: Text('Sports')),
//                 //     Tab(child: Text('Sports')),
//                 //   ],
//                 // ),
//               ),
//             ];
//           },
//           body: TabBarView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(TSizes.defaultSpace),
//                 child: Column(
//                   children: [
//                     //Brand
//                     RoundedContainer(
//                       showBorder: true,
//                       borderColor: TColors.darkGrey,
//                       backgroundColor: Colors.transparent,
//                       margin:
//                           const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
//                       child: Column(
//                         children: [
//                           const BrandCard(showBorder: false),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),


// import 'package:app_ban_giay/common/widgets/appbar.dart';
// import 'package:app_ban_giay/common/widgets/cart_menu_icon.dart';
// import 'package:app_ban_giay/common/widgets/tabbar.dart';
// import 'package:app_ban_giay/features/shop/screens/home/product/gridlayout_product.dart';
// import 'package:app_ban_giay/features/shop/screens/home/widget/search_container.dart';
// import 'package:app_ban_giay/features/shop/screens/home/widget/section_heading.dart';
// import 'package:app_ban_giay/features/shop/screens/store/widget/brand_card.dart';
// import 'package:flutter/material.dart';

// class StoreScreen extends StatelessWidget {
//   const StoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5, // Adjust based on number of tabs
//       child: Scaffold(
//         appBar: TAppBar(
//           title: Text('Cửa hàng', style: Theme.of(context).textTheme.headlineMedium),
//           actions: [
//             CartIcon(onPressed: () {}),
//           ],
//         ),
//         body: Scaffold( // Remove NestedScrollView (if no nested scrolling is needed)
//           body: Column( // Or other layout widget as needed
//             children: [
//               // Search container (customize as needed)
//               const SearchContainer(text: 'Tìm sản phẩm', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
//               const SizedBox(height: 16), // Adjust spacing as needed

//               // Hãng giày section
//               SectionHeading(title: 'Hãng giày', onPressed: () {}),
//               const SizedBox(height: 8), // Adjust spacing as needed

//               GridLayoutProduct(
//                 itemCount: 4, // Adjust based on data
//                 mainAxisExtent: 80, // Adjust based on design and data
//                 itemBuilder: (_, index) {
//                   return const BrandCard(showBorder: false);
//                 },
//               ),
//               const SizedBox(height: 16), // Adjust spacing as needed

//               // Tabs (replace with appropriate content for each tab)
//               const TTabBar(
//                 tabs: [
//                   Tab(child: Text('Thể thao')), // Provide unique tab labels
//                   Tab(child: Text('Giày chạy')),
//                   Tab(child: Text('Giày sandals')),
//                   Tab(child: Text('Phụ kiện')),
//                   Tab(child: Text('Giảm giá')),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

