import 'package:flutter/material.dart';

class ResponsivePage extends StatefulWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  _ResponsivePageState createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: currentWidth < 600 ? Colors.blue : Colors.pink,
      body: Center(
        child: Text(currentWidth.toString()),
      ),
    );
  }
}
