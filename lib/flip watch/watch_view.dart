import 'package:flipwatch/flip%20watch/flip_widget.dart';
import 'package:flipwatch/flip%20watch/joint_widget.dart';
import 'package:flipwatch/flip%20watch/wheel_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class FlipWatchView extends StatefulWidget {
  const FlipWatchView({Key? key}) : super(key: key);

  @override
  State<FlipWatchView> createState() => _FlipWatchViewState();
}

class _FlipWatchViewState extends State<FlipWatchView> {
  final bool _isElevated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 158, 144),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  //padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const RadialGradient(
                        colors: [Color(0xff262626), Color(0xff171717)],
                        center: Alignment.topCenter,
                        // stops: [0.1, 0.3],
                        radius: 100,
                      )),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    // padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(5, -5),
                          spreadRadius: 10,
                          blurRadius: 40,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff292727),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/Braun_Logo.svg",
                              color: Colors.white,
                              width: 50,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const FlipWidget(
                              type: FlipType.hours,
                            ),
                            const JointWidget(),
                            const FlipWidget(
                              type: FlipType.min,
                            ),
                            const JointWidget(),
                            const FlipWidget(
                              type: FlipType.seconds,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              DateFormat('a').format(DateTime.now()),
                              style: const TextStyle(
                                  color: Color(0xffA4A4A4),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            ScrollWheelWidget(
                              length: 92,
                              f: (i) {
                                print("scroll value is $i");
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // ScrollWheelWidget(
                            //   length: 240,
                            //   f: (i) {
                            //     print("here is $i");
                            //   },
                            // ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // ScrollWheelWidget(
                            //   length: 240,
                            //   f: (i) {
                            //     print("here is $i");
                            //   },
                            // ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // GestureDetector(
                            //   onPanDown: (d) {
                            //     setState(() {
                            //       _isElevated = !_isElevated;
                            //     });
                            //   },
                            //   onPanEnd: (d) {
                            //     setState(() {
                            //       _isElevated = !_isElevated;
                            //     });
                            //   },
                            //   child: AnimatedContainer(
                            //     duration: const Duration(
                            //       milliseconds: 200,
                            //     ),
                            //     height: 100,
                            //     padding: const EdgeInsets.all(10),
                            //     child: Container(
                            //       padding: const EdgeInsets.all(10),
                            //       decoration: BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           border: Border.all(
                            //               color: const Color(0xffA4A4A4),
                            //               width: 2)),
                            //       child: const Center(
                            //         child: Text(
                            //           "START",
                            //           style: TextStyle(
                            //               color: Color(0xffA4A4A4),
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //     decoration: BoxDecoration(
                            //       gradient: const RadialGradient(
                            //         colors: [
                            //           Color(0xff262626),
                            //           Color(0xff171717),
                            //         ],
                            //         center: Alignment.topCenter,
                            //         stops: [0.3, 1.0],
                            //         radius: 1,
                            //       ),
                            //       //color: const Color(0xff151515),
                            //       shape: BoxShape.circle,
                            //       // If widget is not elevated, elevate it.
                            //       boxShadow: !_isElevated
                            //           ? [
                            //               const BoxShadow(
                            //                 color:
                            //                     Color.fromARGB(255, 0, 0, 0),
                            //                 offset: Offset(5, 5),
                            //                 blurRadius: 15,
                            //                 spreadRadius: .5,
                            //               ),
                            //               const BoxShadow(
                            //                 color: Colors.black,
                            //                 offset: Offset(-5, -5),
                            //                 blurRadius: 15,
                            //                 spreadRadius: .5,
                            //               ),
                            //             ]
                            //           : null,
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



  // // Elevation Effect
 