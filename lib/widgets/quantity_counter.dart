import 'package:flutter/material.dart';
import '../core/app_colors.dart';

// Widget Counter Kuantitas Sesuai Komponen Figma "Component 2" (#125:598)
// Terdiri dari: Tombol Bulat minus (-), angka kuantitas (1..n), Tombol Bulat plus (+)
class QuantityCounter extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final int minQuantity;
  final int maxQuantity;

  const QuantityCounter({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
    this.minQuantity = 1,
    this.maxQuantity = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.grayInput.withValues(alpha: 0.8),
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tombol Minus (-) Sesuai Figma Group 38 (#I125:604;125:573)
          InkWell(
            onTap: quantity > minQuantity
                ? () => onQuantityChanged(quantity - 1)
                : null,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: quantity > minQuantity
                    ? AppColors.primaryGold.withValues(alpha: 0.15)
                    : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.remove,
                  size: 18,
                  color: quantity > minQuantity
                      ? AppColors.primaryGold
                      : Colors.grey.shade400,
                ),
              ),
            ),
          ),

          // Angka Kuantitas Sesuai Figma (#I125:604;125:577)
          Container(
            constraints: const BoxConstraints(minWidth: 36),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),

          // Tombol Plus (+) Sesuai Figma Group 39 (#I125:604;125:574)
          InkWell(
            onTap: quantity < maxQuantity
                ? () => onQuantityChanged(quantity + 1)
                : null,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: quantity < maxQuantity
                    ? AppColors.primaryGold
                    : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 18,
                  color: quantity < maxQuantity
                      ? Colors.white
                      : Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
