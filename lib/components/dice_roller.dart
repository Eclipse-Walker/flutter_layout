import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> with TickerProviderStateMixin {
  var currentDice = 3;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _controller.stop();
      }
    });
  }

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rollDice() {
    setState(() {
      int newDice;
      do {
        newDice = Random().nextInt(6) + 1;
      } while (newDice == currentDice);
      currentDice = newDice;
      _controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: _animation,
          child: Image.asset(
            'assets/images/dice-$currentDice.png',
            width: 200,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          // style: TextButton.styleFrom(
          //   backgroundColor: Colors.grey[500],
          //   foregroundColor: Colors.white,
          //   textStyle: const TextStyle(
          //     fontSize: 20,
          //   ),
          // ),
          onPressed: rollDice,
          child: const Text(
            'Roll Dice',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
