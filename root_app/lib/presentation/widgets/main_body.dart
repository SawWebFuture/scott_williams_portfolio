import 'package:flutter/material.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  //TODO: retroduce these in the home screen
  // Random random = Random();
  // List<int> changeWidth = [100, 200, 300];
  // int widthIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          HexColor('#448ea2'),
          HexColor('#a7e8f7'),
          Colors.white,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/flower_landscape_3.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 21.0,
                horizontal: 16,
              ),
              child: ActionSlider.standard(
                sliderBehavior: SliderBehavior.stretch,
                backgroundColor: Colors.white,
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 1));
                  controller.success(); //starts success animation
                  await Future.delayed(const Duration(seconds: 1));
                  //TODO: go to home screen
                  controller.reset(); //resets the slider
                },
                child: const Text(
                  'Slide to enter app',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
          //TODO: reintroduce these in the home screen
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.2),
          //       borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(30),
          //         topRight: Radius.circular(30),
          //       ),
          //     ),
          //     height: MediaQuery.of(context).size.height / 2,
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(55.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             random = Random();
          //             widthIndex = widthIndex == 2 ? 0 : widthIndex + 1;
          //           });
          //         },
          //         child: Container(
          //           height: 50,
          //           decoration: BoxDecoration(
          //               color: Theme.of(context).primaryColor,
          //               borderRadius: const BorderRadius.only(
          //                 topLeft: Radius.circular(21),
          //                 topRight: Radius.circular(21),
          //               ),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.white.withOpacity(0.5),
          //                   spreadRadius: 3,
          //                   blurRadius: 20,
          //                   offset: const Offset(5, 5),
          //                 )
          //               ]),
          //           child: const Center(
          //             child: Text(
          //               'Scott Williams Portfolio',
          //               style: TextStyle(
          //                   fontSize: 21,
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(21.0),
          //         child: Center(
          //           child: CustomPaint(
          //             size: Size(changeWidth[widthIndex].toDouble(), 100),
          //             painter: CustomShape(random: random),
          //           ),
          //         ),
          //       ),
          //       Highlight(),
          //       // DraggableWidget(),
          //       const SizedBox(
          //         height: 21,
          //       ),
          //       Expanded(
          //         child: Container(
          //           color: Colors.white,
          //           child: DragDrop(),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
