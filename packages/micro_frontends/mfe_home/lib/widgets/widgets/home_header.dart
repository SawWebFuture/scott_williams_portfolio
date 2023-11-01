import 'package:flutter/material.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

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
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: isDark ? HexColor('#044b4d') : Colors.white,
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 6,),
        ],
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome ',
                style: TextStyle(
                  fontSize: 22,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              TextSpan(
                text: name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
