import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/screens/home/widget/categorylist.dart';
import 'package:shopywell/screens/home/widget/deal.dart';
import 'package:shopywell/screens/home/widget/offer_carousal.dart';
import 'package:shopywell/screens/home/widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/logo/shopywelllogo.png'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              // backgroundImage: AssetImage("assets/images/user.jpg"),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔍 Search Bar
          const SearchBarWidget(),

          const SizedBox(height: 12),

          // 🏷️ All Featured Title + Buttons
          Padding(
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
                    iconButton(Icons.sort),
                    const SizedBox(width: 8),
                    iconButton(Icons.filter_alt_outlined),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 🔁 Category List
          const CategoryList(),

          //  offer carousal
          OfferCarousel(),
          const SizedBox(height: 16),
          // deal of the day
          DealoftheDay(),
        ],
      ),
    );
  }

  Widget iconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryWhite,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Icon(icon),
    );
  }
}
