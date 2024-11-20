class TaskModel {
  int? id;
  String? name;
  String? date;
  String? time;

  TaskModel({this.date, this.id, this.name, this.time});

  TaskModel.forJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    date = map["date"];
    time = map["time"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'time': time,
    };
  }
}
