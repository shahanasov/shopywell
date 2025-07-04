import 'package:flutter/material.dart';
import 'package:shopywell/core/widgets/appbar.dart';
import 'package:shopywell/core/widgets/filter_title.dart';
import 'package:shopywell/screens/home/widget/search_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔍 Search Bar
            const SearchBarWidget(),

            const SizedBox(height: 12),
            FilterTitle(),
           
          ],
        ),
      ),
    );
  }
}
