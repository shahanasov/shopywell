import 'package:flutter/material.dart';

class FlatAndHeelsCard extends StatelessWidget {
  const FlatAndHeelsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Shoe Image
          Image.asset(
            'assets/images/healshoe.png', 
            width: 100,
          ),
          const SizedBox(width: 20),
          // Text and Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Flat and Heels      ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Stand a chance to get rewarded',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Visit now'),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
