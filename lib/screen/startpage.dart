import 'package:flutter/material.dart';
import 'package:flutter_application_2/helpers/helpers.dart';
import 'package:flutter_application_2/screen/secondscreen.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5ec766),
      body: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(SecondScreen.routeName),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: calculateSize(100),
                    width: calculateSize(100),
                    decoration: BoxDecoration(),
                    child: CustomPaint(
                      painter: RPSCustomPainter(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: appText(
                    "Skip",
                    18,
                    weight: FontWeight.w700,
                    color: Color(0xff5ec766),
                    rightmargin: 30.0,
                    topmargin: 40.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: calculateSize(50),
          ),
          appText(
            "Welcome to the\n Adeo Experience ",
            18,
            weight: FontWeight.w700,
            color: Colors.white,
          ),
          appText(
            "You currently have \nNO Subscriptions.\n\n\nFirst take a DIAGNOSTIC TEST \nto determine the right course \nfor you.  ",
            18,
            weight: FontWeight.w700,
            color: Colors.white,
            topmargin: 30.0,
          ),
          SizedBox(
            height: calculateSize(60),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(SecondScreen.routeName),
            child: Container(
              width: calculateSize(180),
              height: calculateSize(53),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(
                    calculateSize(20),
                  )),
              child: appText(
                "Next",
                17,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2900000, 0);
    path_0.quadraticBezierTo(size.width * 0.0936000, size.height * 0.3820000,
        size.width * 0.0577000, size.height * 0.5031000);
    path_0.cubicTo(
        size.width * 0.0270000,
        size.height * 0.5922000,
        size.width * -0.0209000,
        size.height * 0.7614000,
        0,
        size.height * 0.8500000);
    path_0.cubicTo(
        size.width * 0.0501000,
        size.height * 0.8995000,
        size.width * 0.1169000,
        size.height * 0.9511000,
        size.width * 0.2900000,
        size.height * 0.9500000);
    path_0.cubicTo(
        size.width * 0.2189000,
        size.height * 0.9661000,
        size.width * 0.5979000,
        size.height * 1.0032000,
        size.width * 0.6800000,
        size.height);
    path_0.quadraticBezierTo(size.width * 0.7600000, size.height * 0.9925000,
        size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.2900000, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
