import 'package:flutter/material.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/screens/home/widget/view_all_button.dart';

class SummerSale extends StatelessWidget {
  const SummerSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 400,
      child: Column(
        children: [
          Image.asset('assets/images/summersale.png'),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New Arrivals '),
                  Text("Summer’ 25 Collections"),
                ],
              ),
              ViewAllButton(),
            ],
          ),
        ],
      ),
    );
  }
}
