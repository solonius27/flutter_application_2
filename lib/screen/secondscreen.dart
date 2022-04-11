import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/startpage.dart';
import 'package:flutter_application_2/screen/thirdscreen.dart';

import '../helpers/helpers.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static const routeName = '/secondscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4ec0df),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(ThirdScreen.routename),
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
          SizedBox(height: calculateSize(50)),
          Stack(
            children: [
              Container(
                height: calculateSize(450),
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: RPSCustomPainter1(),
                  //size: Size(double.infinity, calculateSize(300)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: appText("Select your level", 20,
                        weight: FontWeight.w700,
                        color: Colors.black,
                        topmargin: 80.0),
                  ),
                  Container(
                    height: calculateSize(250),
                    child: ListWheelScrollView(
                      itemExtent: 50.0,
                      magnification: 2.0,
                      useMagnifier: true,
                      children: [
                        appText(
                          "Primary",
                          17,
                          color: Colors.white,
                        ),
                        appText("Junior high", 17, color: Colors.white),
                        appText("Senior high", 17, color: Colors.white),
                        appText("Tertiary", 17, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xff49b6d9)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2200000);
    path_0.cubicTo(
        size.width * 0.1468000,
        size.height * 0.0465000,
        size.width * 0.2593000,
        size.height * 0.0131000,
        size.width * 0.4100000,
        0);
    path_0.quadraticBezierTo(size.width * 0.7518000, size.height * 0.0144000,
        size.width, size.height * 0.4200000);
    path_0.lineTo(size.width, size.height * 0.7300000);
    path_0.quadraticBezierTo(size.width * 0.8342000, size.height * 0.9796000,
        size.width * 0.6600000, size.height);
    path_0.cubicTo(
        size.width * 0.5298000,
        size.height * 0.9939000,
        size.width * 0.1869000,
        size.height * 0.9005000,
        0,
        size.height * 0.6800000);
    path_0.cubicTo(0, size.height * 0.5650000, 0, size.height * 0.5650000, 0,
        size.height * 0.2200000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
