// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    String message;
    User user;
    int status;

    UserResponse({
        required this.message,
        required this.user,
        required this.status,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        message: json["message"],
        user: User.fromJson(json["user"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "status": status,
    };
}

class User {
    String name;
    String password;
    String email;
    String tipoUser;
    String id;
    String authToken;

    User({
        required this.name,
        required this.password,
        required this.email,
        required this.tipoUser,
        required this.id,
        required this.authToken,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        password: json["password"],
        email: json["email"],
        tipoUser: json["tipoUser"],
        id: json["_id"],
        authToken: json["authToken"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
        "tipoUser": tipoUser,
        "_id": id,
        "authToken": authToken,
    };
}
