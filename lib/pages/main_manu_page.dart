import 'package:flutter/material.dart';

import 'package:flutter_layout/pages/main_page.dart';
import 'package:flutter_layout/pages/post_page.dart';
import 'package:flutter_layout/pages_foods/home.dart';
import '../components/gradient_container.dart';
import '../responsive/desktop_body.dart';
import '../responsive/mobile_body.dart';
import '../responsive/responsive_layout.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENU'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: const [
            MenuOption(
              icon: Icons.view_quilt,
              label: 'Responsive',
              destination: ResponsiveLayout(
                mobileBody: MobileBody(),
                desktopBody: DesktopBody(),
              ),
              bgColor: Color(0xffC9E6F0),
              iconColor: Color(0xff78B3CE),
            ),
            MenuOption(
              icon: Icons.restaurant,
              label: 'Breakfast',
              destination: HomePage(),
              iconColor: Color(0xffB59F78),
              bgColor: Color(0xffFAF6E3),
            ),
            MenuOption(
              icon: Icons.casino,
              label: 'Roll-Dice',
              destination:
                  GradientContainer(Colors.black87, Colors.grey, Colors.white),
            ),
            MenuOption(
              icon: Icons.collections,
              label: 'Gallery',
              destination: MainPage(),
              bgColor: Color.fromARGB(255, 224, 103, 127),
              iconColor: Color(0xffF6D6D6),
            ),
            MenuOption(
              icon: Icons.local_post_office,
              label: 'Post',
              destination: PostListPage(),
              bgColor: Color(0xffE5E1DA),
              iconColor: Color(0xffDEAA79),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? destination;
  final Color? bgColor;
  final Color? iconColor;

  const MenuOption({
    super.key,
    required this.icon,
    required this.label,
    this.destination,
    this.bgColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destination!,
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: bgColor ?? const Color.fromARGB(255, 221, 240, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: iconColor ?? Colors.blue),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
