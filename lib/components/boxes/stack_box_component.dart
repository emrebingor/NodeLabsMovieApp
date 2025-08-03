import 'package:flutter/material.dart';

final class StackBoxComponent extends StatelessWidget {
  const StackBoxComponent({
    super.key,
    required this.percentage,
    required this.discountedAmount,
    required this.amountCoin,
    required this.amountPrice,
    required this.bgGradient,
    required this.gradient,
  });
  final String percentage;
  final String discountedAmount;
  final String amountCoin;
  final String amountPrice;
  final List<Color> bgGradient;
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: bgGradient,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            height: 218,
            child: Column(
              children: [
                Spacer(),
                Text(
                  discountedAmount,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  amountCoin,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Jeton',
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  amountPrice,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Başına haftalık',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -18,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradient),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                percentage,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}