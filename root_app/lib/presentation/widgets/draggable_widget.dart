import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({super.key});

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  bool _isAccepted = false;

  void onDragCompleted() {
    setState(() {
      _isAccepted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Draggable(
          data: "Drag Me!",
          feedback: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withValues(alpha: 0.5),
            alignment: Alignment.center,
            child: const Text("Drag Me!"),
          ),
          childWhenDragging: Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            alignment: Alignment.center,
            child: const Text("Drag Me!"),
          ),
          onDragEnd: (details) {
            // Check if the draggable widget was accepted
            if (details.wasAccepted) {
              onDragCompleted();
            }
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text("Drag Me!"),
          ),
        ),
        const SizedBox(height: 20),
        DragTarget(
          builder: (BuildContext context, List<String?> candidateData,
              List<dynamic> rejectedData) {
            return Container(
              width: 150,
              height: 150,
              color: _isAccepted ? Colors.green : Colors.red,
              alignment: Alignment.center,
              child: const Text("Drop Here"),
            );
          },
        ),
      ],
    );
  }
}
