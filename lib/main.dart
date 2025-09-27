import 'package:flutter/material.dart';
import 'package:perplexity_clone/pages/home_page.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Perplexity',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme.copyWith(
            bodyMedium: const TextStyle(
              fontSize: 16,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
