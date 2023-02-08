import 'package:flipwatch/flip%20watch/pointer_painter.dart';
import 'package:flutter/material.dart';

class ScrollWheelWidget extends StatefulWidget {
  const ScrollWheelWidget({Key? key, required this.length, required this.f})
      : super(key: key);

  final int length;
  final Function(double v) f;

  @override
  State<ScrollWheelWidget> createState() => _ScrollWheelWidgetState();
}

class _ScrollWheelWidgetState extends State<ScrollWheelWidget> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _controller.addListener(() {
      widget.f((_controller.offset / 64).floor() % (widget.length / 4));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              height: 200,
              width: 5,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -1),
                      spreadRadius: 0.2,
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )
                  ],
                  gradient: RadialGradient(
                    colors: [Color(0xff464646), Color(0xff020202)],
                    center: Alignment.center,
                    radius: 4,
                  )),
            ),
            Container(
              height: 200,
              width: 50,
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.2, 0.8, 1],
                ),
              ),
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -1),
                      spreadRadius: 0.2,
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )
                  ],
                  gradient: RadialGradient(
                    colors: [Color(0xff464646), Color(0xff0e0e0e)],
                    center: Alignment.center,
                    radius: 6,
                  )),
              child: Center(
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: 16,
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: List<Widget>.generate(
                        widget.length,
                        (index) => index % 4 == 0
                            ? Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      width: 20,
                                      height: 2,
                                      color: Colors.white,
                                      // child:
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '${index / 4}',
                                      style: const TextStyle(
                                        color: Color(0xffA4A4A4),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  width: 15,
                                  height: 2,
                                  color: Colors.grey,
                                  // child: Text(
                                  //   '${index + 1}',
                                  // ),
                                ),
                              )),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 5,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -1),
                      spreadRadius: 0.2,
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )
                  ],
                  gradient: RadialGradient(
                    colors: [Color(0xff464646), Color(0xff020202)],
                    center: Alignment.center,
                    radius: 4,
                  )),
            ),
          ],
        ),
        Positioned(
          top: 90,
          child: CustomPaint(
            size: const Size(10,
                10), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: PointerPainter(),
          ),
        ),
      ],
    );
  }
}
