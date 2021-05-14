class ToDo {
  String text;
  bool isDone;

  ToDo({this.text, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
