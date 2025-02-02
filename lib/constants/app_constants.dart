import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF32ADE6);
  static const secondary = Color(0xFF2D3142);
  static const background = Colors.white;
  static const grey = Color(0xFF9B9B9B);
  static const lightGrey = Color(0xFFF5F5F5);

  static final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

class AppStyles {
  static const headerStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );

  static const subHeaderStyle = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
  );
} 