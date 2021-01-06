class Note {
  int id;
  String title;
  String content;
  DateTime date;

  Note({this.title, this.content, this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'date': date
    };
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
    date = map['date'];
  }
}

final Map<String, int> categories = {'Notes': 4, 'Work': 10, 'Shopping': 2};

final List<Note> notes = [
  Note(
      title: "Test Note One",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 2",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 3",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 4",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 5",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 6",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 7",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 8",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 9",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note 10",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note One",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note One",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note One",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note One",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note One",
      content: "this is a test of note one",
      date: DateTime.now()),
  Note(
      title: "Test Note Last",
      content: "this is a test of note one",
      date: DateTime.now()),
];
