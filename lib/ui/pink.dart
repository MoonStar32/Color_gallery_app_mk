import 'package:flutter/material.dart';

class PinlScreen extends StatefulWidget {
  const PinlScreen({super.key});

  @override
  State<PinlScreen> createState() => _PinlScreenState();
}

class _PinlScreenState extends State<PinlScreen> {
  double slideToObject = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      duration: const Duration(milliseconds: 500),
      color: Colors.pink[100],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: 40 + slideToObject * 3),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            height: 120,
            child: Slider(
              value: slideToObject,
              max: 100,
              activeColor: Colors.redAccent,
              inactiveColor: Colors.white,
              onChanged: (value) => setState(() => slideToObject = value),
            ),
          ),
        ],
      ),
    );
  }
}
