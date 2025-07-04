import 'package:flutter/material.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

class DealoftheDay extends StatelessWidget {
  AppColors? color;
  String? text;
  DealoftheDay({super.key, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(color: AppColors.lightBlue);
  }
}
