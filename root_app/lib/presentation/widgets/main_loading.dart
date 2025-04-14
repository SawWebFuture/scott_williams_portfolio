import 'package:flutter/material.dart';
import 'package:scott_williams_portfolio/consts/consts.dart';

class MainLoading extends StatefulWidget {
  const MainLoading({Key? key}) : super(key: key);

  @override
  State<MainLoading> createState() => _MainLoadingState();
}

class _MainLoadingState extends State<MainLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The RotationTransition widget rotates its child continuously.
    return Scaffold(
      backgroundColor: Colors.white, // Use a light background for web.
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              // A thin border outlines the container.
              border: Border.all(color: Consts.backgroundColor, width: 4),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Consts.backgroundColor.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            // The padding creates space for the inner progress indicator.
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Consts.backgroundColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
