import 'package:flutter/material.dart';
import 'package:mfe_home/widgets/widgets/home_portfolio_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Welcome ',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              HomePortfolioItem(),
              HomePortfolioItem(),
              HomePortfolioItem(),
            ],
          ),
        ),
      ],
    );
  }
}
