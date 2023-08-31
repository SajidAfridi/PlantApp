import 'package:flutter/cupertino.dart';
import 'package:plant_store_app/models/sqflite_helper.dart';

class UserRepository {
  String email;
  String password;

  UserRepository({
    required this.email,
    required this.password,
  });
  Future<bool> registerUser({
   required UserRepository user,
  }) async {
    await PlantHelper().createUser(user);
    return true;
  }

  Future<bool> authenticate({required UserRepository user}) async {

    var userFromDB = await PlantHelper().getUserByEmail(user.email);

    if (userFromDB != null && userFromDB.password == user.password) {
      // Credentials are correct
      return true;
    } else {
      // Credentials are incorrect
      return false;
    }
  }

  factory UserRepository.fromJson(Map<String, dynamic> json) => UserRepository(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };

}
