import 'package:equatable/equatable.dart';
import 'package:word_prime/base/base_model.dart';

class UserModel extends BaseModel<UserModel> with EquatableMixin {
  String? email;
  String? password;
  String? profileImageAddress;
  String? userId;
  String? userName;
  bool? emailVerification;
  int? totalPost;
  int? totalScore;
  int? totalFollow;
  int? totalFollower;
  List<String>? userNameKeywords;

  UserModel({
    this.email,
    this.password,
    this.profileImageAddress,
    this.userId,
    this.userName,
    this.emailVerification,
    this.totalPost,
    this.totalScore,
    this.totalFollow,
    this.totalFollower,
    this.userNameKeywords,
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
        totalScore,
        totalFollow,
        totalFollower,
        userNameKeywords
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
    int? totalFollow,
    int? totalFollower,
    List<String>? userNameKeywords,
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
      totalFollow: totalFollow ?? this.totalFollow,
      totalFollower: totalFollower ?? this.totalFollower,
      userNameKeywords: userNameKeywords ?? this.userNameKeywords,
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
      'total_follow': totalFollow,
      'total_follower': totalFollower,
      'user_name_keywords': userNameKeywords,
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
      totalFollow: json['total_follow'] as int?,
      totalFollower: json['total_follower'] as int?,
      userNameKeywords: (json['user_name_keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}
