import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  int? id;
  String? fullName;
  String? username;
  String? email;
  String? phoneNumber;
  String? address;
  DateTime? dateOfBirth;
  String? profilePicture;
  bool? isAdmin;
  bool? isCustomer;
  bool? isStaff;
  bool? isSuperuser;
  int? fidelityPoints;
  String? password;

  User({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.profilePicture,
    this.isAdmin,
    this.isCustomer,
    this.isStaff,
    this.isSuperuser,
    this.fidelityPoints,
    this.password,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
      id: json["id"],
      fullName: json["Full_Name"],
      username: json["username"],
      email: json["email"],
      phoneNumber: json["Phone_Number"],
      address: json["Address"],
      dateOfBirth: DateTime.parse(json["Date_of_Birth"]),
      profilePicture: json["Profile_Picture"],
      isAdmin: json["is_admin"],
      isCustomer: json["is_customer"],
      isStaff: json["is_staff"],
      isSuperuser: json["is_superuser"],
      fidelityPoints: json["Fidelity_Points"],
      password: json["password"],
  );

  Map<String, dynamic> toMap() => {
      "id": id,
      "Full_Name": fullName,
      "username": username,
      "email": email,
      "Phone_Number": phoneNumber,
      "Address": address,
      "Date_of_Birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
      "Profile_Picture": profilePicture,
      "is_admin": isAdmin,
      "is_customer": isCustomer,
      "is_staff": isStaff,
      "is_superuser": isSuperuser,
      "Fidelity_Points": fidelityPoints,
      "password": password,
  };
}