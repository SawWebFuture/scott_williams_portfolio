import 'package:flutter/material.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class HomeDate extends StatelessWidget {
  const HomeDate({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            color: HexColor('#448ea2'),
            borderRadius: BorderRadius.circular(21),
          ),
          child: Center(
            child: Text(
              date,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
