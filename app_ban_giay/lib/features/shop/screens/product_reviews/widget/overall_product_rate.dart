import 'package:app_ban_giay/features/shop/screens/product_reviews/widget/rating_grogress.dart';
import 'package:flutter/material.dart';


//Xếp hạng đánh giá
class OverallProductRate extends StatelessWidget {
  const OverallProductRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text('4.9', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              //Cấp độ đánh giá
              RatingProgressIndicator(text: '5', value: 1.0),
              RatingProgressIndicator(text: '4', value: 0.9),
              RatingProgressIndicator(text: '3', value: 0),
              RatingProgressIndicator(text: '2', value: 0),
              RatingProgressIndicator(text: '1', value: 0.1),
            ],
          ),
        ),
      ],
    );
  }
}