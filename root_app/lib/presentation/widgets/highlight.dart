import 'package:flutter/material.dart';

class Highlight extends StatefulWidget {
  const Highlight({super.key});

  @override
  State<Highlight> createState() => _HighlightState();
}

class _HighlightState extends State<Highlight> {
  bool _isHighlighted = false;

  void _toggleHighlight() {
    setState(() {
      _isHighlighted = !_isHighlighted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _toggleHighlight();
      },
      onTapUp: (_) {
        _toggleHighlight();
      },
      onTapCancel: () {
        _toggleHighlight();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 200,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isHighlighted
              ? Colors.white.withValues(alpha: 0.3)
              : Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Transform Me',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
