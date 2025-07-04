import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.softWhite,
    surfaceTint: AppColors.accentPink,
  ),
  scaffoldBackgroundColor: AppColors.softWhite,
  primaryColor: AppColors.primaryRed,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryPink,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.softWhite),
    titleTextStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.softWhite,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryRed),
      borderRadius: BorderRadius.circular(10),
    ),
    labelStyle: const TextStyle(color: AppColors.textSecondary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryRed,
      foregroundColor: AppColors.primaryWhite,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  textTheme:  GoogleFonts.montserratTextTheme(),
);
