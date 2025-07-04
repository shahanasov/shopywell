import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

class FilterTitle extends StatelessWidget {
  const FilterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "All Featured",
            style: GoogleFonts.montserrat(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              iconButton(Icons.sort, 'Sort'),
              const SizedBox(width: 8),
              iconButton(Icons.filter_alt_outlined, 'Filter'),
            ],
          ),
        ],
      ),
    );
  }

  Widget iconButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryWhite,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(spacing: 3, children: [Text(text), Icon(icon)]),
    );
  }
}
