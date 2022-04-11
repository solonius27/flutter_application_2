class QA {
  String? id;
  String? qustion;
  List<Answers>? answers;

  QA({
    this.id,
    this.qustion,
    this.answers,
  });
}

class Answers {
  String? id;
  String? text;
  String? value;

  Answers({
    this.id,
    this.text,
    this.value,
  });
}
