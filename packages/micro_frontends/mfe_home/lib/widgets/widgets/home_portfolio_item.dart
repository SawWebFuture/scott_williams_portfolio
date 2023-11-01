import 'package:flutter/material.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class HomePortfolioItem extends StatelessWidget {
  const HomePortfolioItem({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  final String imageUrl;
  final VoidCallback onTap;

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
                  color: HexColor('#448ea2'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  onTap.call();
                },
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(imageUrl),
                        ),
                      ),
                    ),
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
