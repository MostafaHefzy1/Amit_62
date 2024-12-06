class UserModel {
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? email;
  String? uId;

  UserModel(
      {this.address,
      this.email,
      this.firstName,
      this.lastName,
      this.phone,
      this.uId});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    phone = json["phone"];
    address = json["address"];
    email = json["email"];
    uId = json["uId"];
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "address": address,
      "email": email,
      "uId": uId,
    };
  }
}
