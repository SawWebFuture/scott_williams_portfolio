import 'package:flutter/material.dart';

class HomeEmptyLinks extends StatelessWidget {
  const HomeEmptyLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Currently in development',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Center(
            child: Text('Coming in 2024'),
          ),
        ],
      ),
    );
  }
}
