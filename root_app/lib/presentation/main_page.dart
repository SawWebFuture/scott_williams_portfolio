import 'package:flutter/material.dart';
import 'package:scott_williams_portfolio/presentation/widgets/main_body.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scott Alan Williams'),
        backgroundColor: HexColor('#448ea2'),
        elevation: 0,
      ),
      body: const MainBody(),
    );
  }
}
