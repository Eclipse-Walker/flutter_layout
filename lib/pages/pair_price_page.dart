import 'package:flutter/material.dart';

class PairPricePage extends StatefulWidget {
  const PairPricePage({super.key});

  @override
  PairPricePageState createState() => PairPricePageState();
}

class PairPricePageState extends State<PairPricePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pair Price'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              'Eazy compair with this app!',
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
