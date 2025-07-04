import 'package:flutter/material.dart';

import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/core/widgets/appbar.dart';
import 'package:shopywell/core/widgets/filter_title.dart';
import 'package:shopywell/screens/home/widget/categorylist.dart';
import 'package:shopywell/screens/home/widget/deal.dart';
import 'package:shopywell/screens/home/widget/deals_scollabe.dart';
import 'package:shopywell/screens/home/widget/offer_carousal.dart';
import 'package:shopywell/screens/home/widget/search_bar.dart';
import 'package:shopywell/screens/home/widget/summer_sale.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      // AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: SizedBox(
      //     height: 40,
      //     child: Image.asset('assets/logo/shopywelllogo.png'),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu, color: Colors.black),
      //     onPressed: () {},
      //   ),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 12),
      //       child: CircleAvatar(
      //         // backgroundImage: AssetImage("assets/images/user.jpg"),
      //       ),
      //     ),
      //   ],
      // ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            const SearchBarWidget(),

            const SizedBox(height: 12),

            // 🏷️ All Featured Title + Buttons
           FilterTitle(),

            const SizedBox(height: 16),

            // 🔁 Category List
            const CategoryList(),

            //  offer carousal
            OfferCarousel(),
            const SizedBox(height: 16),
            // deal of the day
            DealOfTheDayWidget(),

            // product card
            ProductListingPage(),
            DealOfTheDayWidget(
              subtitle: "Last Date 29/02/22",
              icon: Icons.calendar_month,
              color: AppColors.accentPink,
              text: 'Trending Products ',
            ),

            ProductListingPage(),
            SummerSale(),
            
          ],
        ),
      ),
    );
  }


}
