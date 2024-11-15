import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/main_page.dart';
import 'package:flutter_layout/pages/responsive_page.dart';
import 'package:flutter_layout/responsive/desktop_body.dart';
import 'package:flutter_layout/responsive/mobile_body.dart';
import 'package:flutter_layout/responsive/responsive_layout.dart';
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
      // home: const MainPage(),
      home: const ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}


/* 
another homepages

ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),

Scaffold(
        body: GradientContainer(Colors.black87, Colors.grey, Colors.white),
      ),

HomePage(),

MainPage(),

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
      // home: const MainPage(),
      home: const ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
 */

