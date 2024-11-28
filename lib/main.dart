import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/main_manu_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/pair_price_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const _prodution = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.dynaPuff(
            fontSize: 30,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          displaySmall: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          titleSmall: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          bodyLarge: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          bodySmall: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          displayMedium: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          headlineLarge: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          headlineMedium: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          headlineSmall: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          labelLarge: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          labelMedium: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          labelSmall: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
          titleMedium: GoogleFonts.dynaPuff(
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      home: _prodution ? const MainMenuPage() : const PairPricePage(),
    );
  }
}
