import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/app_provider.dart';
import 'package:flutter_application_2/screen/quizscreen.dart';
import 'package:flutter_application_2/screen/secondscreen.dart';
import 'package:flutter_application_2/screen/startpage.dart';
import 'package:flutter_application_2/screen/thirdscreen.dart';
import 'package:provider/provider.dart';

import 'helpers/sizeConfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: StartPage(),
                routes: {
                  SecondScreen.routeName: (ctx) => SecondScreen(),
                  ThirdScreen.routename: (ctx) => ThirdScreen(),
                  QuizScreen.routeName: (ctx) => QuizScreen(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
