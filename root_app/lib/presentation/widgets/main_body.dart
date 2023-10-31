import 'package:flutter/material.dart';
import 'package:scott_williams_portfolio/consts/consts.dart';
import 'package:scott_williams_portfolio/presentation/widgets/user_name_dialog/user_name_dialog.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    super.key,
    required this.isDark,
    required this.onPageChange,
  });

  final bool isDark;
  final Function(String) onPageChange;

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
          Consts.backgroundColor,
          Consts.backgroundColor,
          widget.isDark ? Consts.lightDarkColor : Consts.lightColor,
          widget.isDark ? Consts.lightDarkColor : Colors.white,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 25),
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/flower_landscape_3.png',
              fit: BoxFit.fill,
            ),
          ),
          //TODO: add flower somewhere else
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 180.0),
          //     child: Motion(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(360),
          //       ),
          //       child: Container(
          //           height: 100,
          //           width: 100,
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //           ),
          //           child: FittedBox(
          //               fit: BoxFit.fitHeight,
          //               child: Image.asset(
          //                   'assets/images/flower_circle_trans.png'))),
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 21.0,
                horizontal: 16,
              ),
              child: ActionSlider.standard(
                sliderBehavior: SliderBehavior.stretch,
                backgroundColor:
                    widget.isDark ? HexColor('#052d2d') : Colors.white,
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  bool isGoHome = false;
                  String name = '';
                  try {
                    var box = await Hive.openBox('nameBox');
                    //TODO: go straight to the home screen
                    debugPrint(box.get('name'));
                    //TODO: update if name is not empty or null
                    isGoHome = true;
                    name = box.get('name');
                  } catch (error) {
                    debugPrint(error.toString());
                  }

                  controller.success(); //starts success animation
                  if (context.mounted && !isGoHome) {
                    showDialog<String?>(
                        context: context,
                        builder: (BuildContext context) {
                          return const UserNameDialog();
                        }).then((value) async {
                      if (value != null && value != 'no') {
                        var box = await Hive.openBox('nameBox');
                        await box.put('name', value);
                        isGoHome = true;
                        name = value;
                      }
                    });
                  } else {
                    await Future.delayed(const Duration(seconds: 1));
                  }
                  if (isGoHome) {
                    widget.onPageChange.call(
                      name,
                    );
                  }
                  controller.reset(); //resets the slider
                },
                child: Text(
                  'Slide to enter app',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: widget.isDark ? Colors.white : Colors.black),
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
