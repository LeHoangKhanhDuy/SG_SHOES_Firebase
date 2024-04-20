import 'package:app_ban_giay/common/widgets/appbar/appbar.dart';
import 'package:app_ban_giay/features/shop/screens/order/widget/order_list.dart';
import 'package:app_ban_giay/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //Appbar
      appBar: TAppBar(title: Text('Đơn hàng của tôi', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        //Orders
        child: OrderListItem(),
      ),
    );
  }
}