import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.isDark,
    required this.name,
  });

  final bool isDark;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Welcome ',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
