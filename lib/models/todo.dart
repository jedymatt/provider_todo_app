class Todo {
  String title;
  String details;
  bool isComplete;

  Todo({required this.title, String? details, bool? isComplete})
      : details = "",
        isComplete = false;
}
