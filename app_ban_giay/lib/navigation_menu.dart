import 'package:app_ban_giay/common/widgets/success_failed_screen/noti_empty.dart';
import 'package:app_ban_giay/features/personalization/screens/setting/setting.dart';
import 'package:app_ban_giay/features/shop/screens/home/home.dart';
import 'package:app_ban_giay/features/shop/screens/store/store.dart';
import 'package:app_ban_giay/features/shop/screens/wishlist/wishlist.dart';
import 'package:app_ban_giay/utils/constants/colors.dart';
import 'package:app_ban_giay/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ?TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.2) :Colors.blue.withOpacity(0.2),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Trang chủ'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Sản phẩm'),
            NavigationDestination(icon: Icon(Iconsax.notification), label: 'Thông báo'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Yêu thích'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Tôi'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(), const NotificationScreen(), const FavouriteScreen(), const SettingScreen()];
}