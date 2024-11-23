import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/start_page.dart';
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
      theme: ThemeData(
        textTheme: GoogleFonts.dynaPuffTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: 'Poppins',
      ),
      home: const StartPage(),
    );
  }
}
