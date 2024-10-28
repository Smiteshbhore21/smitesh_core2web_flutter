class TodoModel {
  String title;
  String desc;
  String date;
  int CardID;

  TodoModel({
    required this.CardID,
    required this.title,
    required this.desc,
    required this.date,
  });

  Map<String, dynamic> todoData() {
    return {
      'CardID': CardID,
      'Title': title,
      'Description': desc,
      'Date': date,
    };
  }
}
