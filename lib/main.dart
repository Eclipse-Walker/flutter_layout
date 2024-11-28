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
          bodyMedium: GoogleFonts.dynaPuff(),
          displaySmall: GoogleFonts.dynaPuff(),
          titleSmall: GoogleFonts.dynaPuff(),
          bodyLarge: GoogleFonts.dynaPuff(),
          bodySmall: GoogleFonts.dynaPuff(),
          displayMedium: GoogleFonts.dynaPuff(),
          headlineLarge: GoogleFonts.dynaPuff(),
          headlineMedium: GoogleFonts.dynaPuff(),
          headlineSmall: GoogleFonts.dynaPuff(),
          labelLarge: GoogleFonts.dynaPuff(),
          labelMedium: GoogleFonts.dynaPuff(),
          labelSmall: GoogleFonts.dynaPuff(),
          titleMedium: GoogleFonts.dynaPuff(),
        ),
      ),
      home: _prodution ? const MainMenuPage() : const PairPricePage(),
    );
  }
}
