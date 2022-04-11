import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/quizscreen.dart';
import 'package:flutter_application_2/screen/startpage.dart';

import '../helpers/helpers.dart';

class ThirdScreen extends StatelessWidget {
  //const ThirdScreen({Key? key}) : super(key: key);
  static const routename = '/third';

  var list = List.generate(7, (index) => {"name": index.toString()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff614e),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(QuizScreen.routeName),
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
          appText(
            "Select your class ",
            20,
            color: Colors.white,
            weight: FontWeight.bold,
            topmargin: 30.0,
            bottommargin: 50.0,
          ),
          Stack(
            children: [
              Container(
                height: calculateSize(200),
                width: double.infinity,
                child: CustomPaint(
                  painter: RPSCustomPainter3(),
                ),
              ),
              SizedBox(
                height: calculateSize(200),
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, i) => Container(
                    margin: EdgeInsets.only(
                        left: calculateSize(30), top: calculateSize(50)),
                    child: appText(list[i]['name']!, 20,
                        leftmargin: 20.0, color: Colors.white),
                  ),
                  itemCount: list.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RPSCustomPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xffe65847)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9950000, size.height * 0.6800000);
    path_0.quadraticBezierTo(size.width * 0.9500000, size.height * 0.2525000,
        size.width * 0.9350000, size.height * 0.1100000);
    path_0.quadraticBezierTo(size.width * 0.9147500, size.height * 0.0431000,
        size.width * 0.8700000, 0);
    path_0.lineTo(size.width * 0.1500000, 0);
    path_0.quadraticBezierTo(size.width * 0.0793500, size.height * 0.0888000,
        size.width * 0.0650000, size.height * 0.1400000);
    path_0.quadraticBezierTo(size.width * 0.0637500, size.height * 0.2175000,
        size.width * 0.0600000, size.height * 0.4500000);
    path_0.quadraticBezierTo(size.width * 0.1047500, size.height * 0.5640000,
        size.width * 0.1350000, size.height * 0.5800000);
    path_0.quadraticBezierTo(size.width * 0.3137500, size.height * 0.5800000,
        size.width * 0.8500000, size.height * 0.5800000);
    path_0.lineTo(size.width * 0.9950000, size.height * 0.6800000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
