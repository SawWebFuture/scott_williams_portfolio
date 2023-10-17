import 'package:flutter/material.dart';

class DragDrop extends StatefulWidget {
  const DragDrop({super.key});

  @override
  State<DragDrop> createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  Offset _position = const Offset(0, 0);

  void onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _position = Offset(
        _position.dx + details.delta.dx,
        _position.dy + details.delta.dy,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _position.dx,
          top: _position.dy,
          child: Draggable(
            data: "Drag Me!",
            feedback: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.pinkAccent,
              child: const Center(
                child: Text('Child When Dragging'),
              ),
            ),
            childWhenDragging: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              alignment: Alignment.center,
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text("Drag Me!"),
            ),
          ),
        ),
        GestureDetector(
          onPanUpdate: onDragUpdate,
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
