import 'package:flutter/material.dart';

class RedScreen extends StatefulWidget {
  const RedScreen({super.key});

  @override
  RedScreenState createState() => RedScreenState();
}

class RedScreenState extends State<RedScreen> {
  double rocketX = 0.0;
  double rocketY = 0.0;

  void updateRocketPosition(Offset offset) {
    setState(() {
      rocketX = offset.dx;
      rocketY = offset.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: GestureDetector(
        onPanUpdate: (details) {
          updateRocketPosition(details.globalPosition);
        },
        child: Stack(
          children: [
            Positioned(
              left: rocketX,
              top: rocketY,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
