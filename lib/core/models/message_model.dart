class MessageModel {
  String? message;
  String? senderID;
  String? reciverID;
  String? dateTime;

  MessageModel({
    this.message,
    this.senderID,
    this.reciverID,
    this.dateTime,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    senderID = json["senderID"];
    reciverID = json["reciverID"];
    dateTime = json["dateTime"];
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "senderID": senderID,
      "reciverID": reciverID,
      "dateTime": dateTime,
    };
  }
}
