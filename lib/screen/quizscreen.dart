import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/app_provider.dart';
import 'package:flutter_application_2/screen/startpage.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../helpers/helpers.dart';
import '../model/question_answer_model.dart';

class QuizScreen extends StatefulWidget {
  //const QuizScreen({ Key? key }) : super(key: key);
  static const routeName = '/quizScreen';

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isloading = true;
  List<QA> qalist = [];
  var questionindex = 0;
  String timer = "0:00";
  var stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) => getquestions());
    super.initState();
  }

  void initiateTimer() {
    // Start
    stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  Future<void> getquestions() async {
    var prov = Provider.of<AppProvider>(context, listen: false);
    try {
      await prov.getQuestions();
      isloading = false;
      qalist = prov.getlist;
      initiateTimer();
      setState(() {});
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5ec766),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                GestureDetector(
                  onTap: () {},
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
                      StreamBuilder(
                        stream: stopWatchTimer.rawTime,
                        initialData: 0,
                        builder: (context, snapshot) {
                          final value = snapshot.data as int;
                          final displayTime = StopWatchTimer.getDisplayTime(
                            value,
                            milliSecond: false,
                          );
                          //print(displayTime);
                          return Align(
                            alignment: Alignment.topRight,
                            child: appText(
                              displayTime.toString(),
                              18,
                              weight: FontWeight.w700,
                              color: Color(0xff5ec766),
                              rightmargin: 10.0,
                              topmargin: 40.0,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: calculateSize(200),
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: appText(
                    qalist[questionindex].qustion.toString(),
                    20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: calculateSize(30),
                ),
                Container(
                  width: double.infinity,
                  height: calculateSize(200),
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: qalist[questionindex].answers!.length,
                    itemBuilder: (ctx, i) {
                      List<Answers>? ans = qalist[questionindex].answers;

                      return appText("${i + 1}. ${ans![i].text.toString()}", 17,
                          color: Colors.white);
                    },
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if ((questionindex + 1) < qalist.length) {
                      questionindex++;
                      setState(() {});
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: appText("Next", 20, color: Colors.white),
                    width: double.infinity,
                    height: calculateSize(52),
                  ),
                )
              ],
            ),
    );
  }
}
