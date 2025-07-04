import 'package:flutter/material.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/screens/checkout/widgets/form.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
          icon: Icon(Icons.arrow_back_ios,color: AppColors.textPrimary,)),
        backgroundColor:Colors.transparent,
       title: Text('Checkout'),
       centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PersonalDetailsForm(),
      )
    );
  }
}