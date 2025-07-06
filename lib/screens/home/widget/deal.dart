import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/screens/home/widget/view_all_button.dart';

class DealOfTheDayWidget extends StatelessWidget {
  Color? color;
  String? text;
  String? subtitle;
  IconData? icon;
  DealOfTheDayWidget({
    super.key,
    this.color,
    this.text,
    this.icon,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? AppColors.lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text ?? 'Deal of the Day',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: AppColors.primaryWhite,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    icon ?? Icons.alarm,
                    color: AppColors.primaryWhite,
                    size: 20,
                  ),
                  Text(
                    subtitle ?? ' 22h 55m 20s remaining',
                    // _formatDuration(remainingTime),
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: AppColors.primaryWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ViewAllButton(),
        ],
      ),
    );
  }
}
