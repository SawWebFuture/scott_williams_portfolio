import 'package:flutter/material.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class HomePortfolioItem extends StatelessWidget {
  const HomePortfolioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 5,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Motion(
                borderRadius: BorderRadius.circular(21),
                shadow: const ShadowConfiguration(
                  color: Colors.grey,
                  maxOffset: Offset(1, 1),
                  topOffset: 20,
                ),
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: const Center(
                    child: Text('Portfolio App Goes here'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
