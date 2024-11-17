import 'package:equatable/equatable.dart';

class UserModel with EquatableMixin {
  String? email;
  String? password;
  String? profileImageAddress;
  String? userId;
  String? userName;
  bool? emailVerification;

  UserModel({
    this.email,
    this.password,
    this.profileImageAddress,
    this.userId,
    this.userName,
    this.emailVerification,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        profileImageAddress,
        userId,
        userName,
        emailVerification
      ];

  UserModel copyWith({
    String? email,
    String? password,
    String? profileImageAddress,
    String? userId,
    String? userName,
    bool? emailVerification,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      profileImageAddress: profileImageAddress ?? this.profileImageAddress,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      emailVerification: emailVerification ?? this.emailVerification,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'profile_image_address': profileImageAddress,
      'user_id': userId,
      'user_name': userName,
      'email_verification': emailVerification,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      profileImageAddress: json['profile_image_address'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      emailVerification: json['email_verification'] as bool?,
    );
  }
}
