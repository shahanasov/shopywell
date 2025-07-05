
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/product_detail_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/core/widgets/filter_title.dart';
import 'package:shopywell/screens/cart/widgets/action_button.dart';
import 'package:shopywell/screens/cart/widgets/compare_button.dart';
import 'package:shopywell/screens/cart/widgets/within_hour_banner.dart';
import 'package:shopywell/screens/cart/widgets/image_carousal.dart';
import 'package:shopywell/screens/cart/widgets/product_details.dart';
import 'package:shopywell/screens/cart/widgets/size_selector.dart';
import 'package:shopywell/screens/home/widget/deals_scollabe.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          // Navigator.of(context).pop();
        },
          icon: Icon(Icons.arrow_back_ios,color: AppColors.textPrimary,)),
        backgroundColor:Colors.transparent,
        actions: [
          IconButton.outlined(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart,color: AppColors.textPrimary,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ImageCarousel(),
            SizeSelector(),
            ProductDetails(),
            InfoButtons(),
            ActionButtons(),
            DeliveryBanner(),
            CompareButtons(),
            FilterTitle(),
            ProductListingPage(),
          ],
        ),
      ),
    );
  }
}
