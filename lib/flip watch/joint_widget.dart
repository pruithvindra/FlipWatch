import 'package:flutter/material.dart';

class JointWidget extends StatelessWidget {
  const JointWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          stops: [0.6, 0.6, 0.8, 0.8],
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 5,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -19),
                    spreadRadius: -1,
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  )
                ],
                gradient: RadialGradient(
                  colors: [Color(0xff464646), Color(0xff0e0e0e)],
                  center: Alignment.center,
                  radius: 6,
                )),
          ),
          Container(
            height: 80,
            width: 5,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -19),
                    spreadRadius: -1,
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
            height: 80,
            width: 5,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -19),
                    spreadRadius: -1,
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  )
                ],
                gradient: RadialGradient(
                  colors: [Color(0xff464646), Color(0xff0e0e0e)],
                  center: Alignment.center,
                  radius: 6,
                )),
          ),
        ],
      ),
    );
  }
}
