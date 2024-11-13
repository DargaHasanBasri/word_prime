import 'package:equatable/equatable.dart';

class UserModel with EquatableMixin {
  String? email;
  String? password;
  String? profileImageAddress;
  String? userId;
  String? userName;

  UserModel({
    this.email,
    this.password,
    this.profileImageAddress,
    this.userId,
    this.userName,
  });

  @override
  List<Object?> get props =>
      [email, password, profileImageAddress, userId, userName];

  UserModel copyWith({
    String? email,
    String? password,
    String? profileImageAddress,
    String? userId,
    String? userName,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      profileImageAddress: profileImageAddress ?? this.profileImageAddress,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'profile_image_address': profileImageAddress,
      'user_id': userId,
      'user_name': userName,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      profileImageAddress: json['profile_image_address'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
    );
  }
}
