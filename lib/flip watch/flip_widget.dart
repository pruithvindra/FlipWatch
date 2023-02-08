import 'dart:math';

import 'package:flipwatch/flip%20watch/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FlipWidget extends StatefulWidget {
  const FlipWidget({Key? key, required this.type}) : super(key: key);
  final FlipType type;

  @override
  State<FlipWidget> createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget> with TickerProviderStateMixin {
  late final Animation<double> secondHalfAnimation;
  late final Animation<double> firstHalfAnimation;

  late AnimationController _flipController;
  int currentFlipValue = 0;
  int previousFlipValue = 0;
  int previousValue = 0;
  int previousSecond = 0;
  late Ticker ticker;
  DateTime current = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    setInitValues(widget.type);

    _flipController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    secondHalfAnimation = Tween<double>(
      begin: 0.0,
      end: 90.0,
    ).animate(
      CurvedAnimation(
        parent: _flipController,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
    firstHalfAnimation = Tween<double>(
      begin: 0.0,
      end: 90.0,
    ).animate(
      CurvedAnimation(
        parent: _flipController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.linear,
        ),
      ),
    );
    ticker = createCustomTicker(widget.type);
    // 5. start ticker
    ticker.start();
    _flipController.forward();
    super.initState();
  }

  Ticker createCustomTicker(FlipType type) {
    current = DateTime.now();
    return createTicker((elapsed) {
      switch (type) {
        case FlipType.hours:
          if (elapsed.inSeconds != previousSecond) {
            previousSecond = elapsed.inSeconds;
            current =
                current = DateTime.now().subtract(const Duration(seconds: 1));
          }

          if (current.hour != previousValue) {
            previousValue = current.hour;
            previousFlipValue =
                (current.hour % 12) == 0 ? 12 : (current.hour % 12) - 1;
            currentFlipValue =
                (current.hour % 12) == 0 ? 12 : (current.hour % 12);
            _flipController
              ..reset()
              ..forward();
          }
          break;
        case FlipType.min:
          if (elapsed.inSeconds != previousSecond) {
            previousSecond = elapsed.inSeconds;
            current =
                current = DateTime.now().subtract(const Duration(seconds: 1));
          }

          if (current.minute != previousValue) {
            previousValue = current.minute;
            previousFlipValue = current.minute == 0 ? 0 : current.minute - 1;
            currentFlipValue = current.minute;
            _flipController
              ..reset()
              ..forward();
          }
          break;
        case FlipType.seconds:
          if (elapsed.inSeconds != previousSecond) {
            previousSecond = elapsed.inSeconds;
            current =
                current = DateTime.now().subtract(const Duration(seconds: 1));
          }
          if (current.second != previousValue) {
            previousValue = current.second;
            previousFlipValue = current.second == 0 ? 59 : current.second - 1;
            currentFlipValue = current.second;
            _flipController
              ..reset()
              ..forward();
          }
          break;
        default:
      }
    });
  }

  void setInitValues(FlipType type) {
    current = DateTime.now();

    switch (type) {
      case FlipType.hours:
        previousFlipValue = current.hour == 0 ? 0 : current.hour - 1;
        currentFlipValue = current.hour;
        break;
      case FlipType.min:
        previousFlipValue = current.minute == 0 ? 59 : current.minute - 1;
        currentFlipValue = current.minute;
        break;
      case FlipType.seconds:
        previousFlipValue = current.second - 1;
        currentFlipValue = current.second;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //topflips
        AnimatedBuilder(
            animation: firstHalfAnimation,
            builder: (context, _) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                      painter: BoxShadowPainter(Flip.up),
                      child: buildFlip(
                        flip: Flip.up,
                        isFliper: true,
                        text: currentFlipValue < 10
                            ? "0$currentFlipValue"
                            : "$currentFlipValue",
                      )),
                  Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..rotateX(firstHalfAnimation.value / 180 * pi),
                      child: buildFlip(
                        flip: Flip.up,
                        text: previousFlipValue < 10
                            ? "0$previousFlipValue"
                            : "$previousFlipValue",
                      ))
                ],
              );
            }),
        //bottomflips
        AnimatedBuilder(
            animation: secondHalfAnimation,
            builder: (context, _) {
              return Stack(
                children: [
                  CustomPaint(
                      painter: BoxShadowPainter(Flip.down),
                      child: buildFlip(
                          flip: Flip.down,
                          text: previousFlipValue < 10
                              ? "0$previousFlipValue"
                              : "$previousFlipValue")),
                  Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(-(90 - secondHalfAnimation.value) / 180 * pi),
                    child: buildFlip(
                        flip: Flip.down,
                        text: currentFlipValue < 10
                            ? "0$currentFlipValue"
                            : "$currentFlipValue"),
                  )
                ],
              );
            }),
      ],
    );
  }

  ClipPath buildFlip(
      {required Flip flip, required String text, bool isFliper = false}) {
    if (flip == Flip.up) {
      return ClipPath(
        clipper: Customshape(flip),
        child: Container(
          margin: const EdgeInsets.only(bottom: 0.5),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: const [Color(0xff0e0e0e), Color(0xff464646)],
                  begin:
                      isFliper ? Alignment.topCenter : Alignment.bottomCenter,
                  end:
                      isFliper ? Alignment.bottomCenter : Alignment.topCenter)),
          child: ClipRRect(
            child: Transform(
              transform: Matrix4.identity()..translate(0, 60),
              child: Text(
                text,
                style: const TextStyle(fontSize: 100, color: Color(0xffA4A4A4)),
              ),
            ),
          ),
        ),
      );
    }
    return ClipPath(
      clipper: Customshape(flip),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff0e0e0e), Color(0xff464646)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
        margin: const EdgeInsets.only(top: 0.5),
        child: ClipRRect(
          child: Transform(
            transform: Matrix4.identity()..translate(0, -57),
            child: Text(
              text,
              style: const TextStyle(fontSize: 100, color: Color(0xffA4A4A4)),
            ),
          ),
        ),
      ),
    );
  }
}

enum FlipType { hours, min, seconds }
