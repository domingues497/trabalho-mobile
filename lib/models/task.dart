class Task {
  final String id;
  final String title;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
