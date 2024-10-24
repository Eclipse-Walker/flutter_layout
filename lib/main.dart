import 'package:flutter/material.dart';
import 'package:flutter_layout/components/gradient_container.dart';
import 'package:flutter_layout/pages/main_page.dart';
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
      ),
      /* home: const Scaffold(
        body: GradientContainer(Colors.black87, Colors.grey, Colors.white),
      ), */
      home: const MainPage(),
    );
  }
}
