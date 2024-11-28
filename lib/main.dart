import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/main_manu_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/pair_price_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.dynaPuffTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: 'Poppins',
      ),
      // home: const MainMenuPage(), //main page
      home: const PairPricePage(), //dev page
    );
  }
}
