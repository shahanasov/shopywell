import 'package:flutter/material.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

class ViewAllButton extends StatelessWidget {
  String? text;
   ViewAllButton({super.key,this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: const BorderSide(color: AppColors.primaryWhite),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text( text?? "View all", style: TextStyle(color: AppColors.primaryWhite)),
          SizedBox(width: 4),
          Icon(Icons.arrow_forward, color: AppColors.primaryWhite, size: 16),
        ],
      ),
    );
  }
}



// ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.redAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Row(
//                   children: const [
//                     Text('View all'),
//                     Icon(Icons.arrow_right_alt),
//                   ],
//                 ),
//               ),