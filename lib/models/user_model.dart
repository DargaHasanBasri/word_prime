import 'package:equatable/equatable.dart';
import 'package:word_prime/models/base_model.dart';

class UserModel extends BaseModel<UserModel> with EquatableMixin {
  String? email;
  String? password;
  String? profileImageAddress;
  String? userId;
  String? userName;
  bool? emailVerification;
  int? totalPost;
  int? totalScore;

  UserModel({
    this.email,
    this.password,
    this.profileImageAddress,
    this.userId,
    this.userName,
    this.emailVerification,
    this.totalPost,
    this.totalScore,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        profileImageAddress,
        userId,
        userName,
        emailVerification,
        totalPost,
        totalScore
      ];

  UserModel copyWith({
    String? email,
    String? password,
    String? profileImageAddress,
    String? userId,
    String? userName,
    bool? emailVerification,
    int? totalPost,
    int? totalScore,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      profileImageAddress: profileImageAddress ?? this.profileImageAddress,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      emailVerification: emailVerification ?? this.emailVerification,
      totalPost: totalPost ?? this.totalPost,
      totalScore: totalScore ?? this.totalScore,
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
      'total_post': totalPost,
      'total_score': totalScore,
    };
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      profileImageAddress: json['profile_image_address'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      emailVerification: json['email_verification'] as bool?,
      totalPost: json['total_post'] as int?,
      totalScore: json['total_score'] as int?,
    );
  }
}
