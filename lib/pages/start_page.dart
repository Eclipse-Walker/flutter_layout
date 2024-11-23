import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/main_page.dart';
import 'package:flutter_layout/pages_foods/home.dart';

import '../components/gradient_container.dart';
import '../responsive/desktop_body.dart';
import '../responsive/mobile_body.dart';
import '../responsive/responsive_layout.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Start Page',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResponsiveLayout(
                            mobileBody: MobileBody(),
                            desktopBody: DesktopBody(),
                          )),
                );
              },
              child: Container(
                color: Colors.pink,
                child: const Text('Responsive-Page'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                color: Colors.pink,
                child: const Text('Breakfast-Page'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GradientContainer(
                        Colors.black87, Colors.grey, Colors.white),
                  ),
                );
              },
              child: Container(
                color: Colors.pink,
                child: const Text('GradientContainer-Page'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              child: Container(
                color: Colors.pink,
                child: const Text('Gallery-Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
