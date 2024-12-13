import 'package:equatable/equatable.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/base/base_model.dart';

class CommentModel extends BaseModel<CommentModel> with EquatableMixin {
  String? commentId;
  String? commentText;
  String? userId;
  String? userName;
  String? userProfileImage;
  int? totalLikes;
  Timestamp? createdDate;

  CommentModel({
    this.commentId,
    this.commentText,
    this.userId,
    this.userName,
    this.userProfileImage,
    this.totalLikes,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        commentId,
        commentText,
        userId,
        userName,
        userProfileImage,
        totalLikes,
        createdDate
      ];

  CommentModel copyWith({
    String? commentId,
    String? commentText,
    String? userId,
    String? userName,
    String? userProfileImage,
    int? totalLikes,
    Timestamp? createdDate,
  }) {
    return CommentModel(
      commentId: commentId ?? this.commentId,
      commentText: commentText ?? this.commentText,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userProfileImage: userProfileImage ?? this.userProfileImage,
      totalLikes: totalLikes ?? this.totalLikes,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'comment_id': commentId,
      'comment_text': commentText,
      'user_id': userId,
      'user_name': userName,
      'user_profile_image': userProfileImage,
      'total_likes': totalLikes,
      'created_date': createdDate,
    };
  }

  @override
  CommentModel fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['comment_id'] as String?,
      commentText: json['comment_text'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      userProfileImage: json['user_profile_image'] as String?,
      totalLikes: json['total_likes'] as int?,
      createdDate: json['created_date'] as Timestamp?,
    );
  }
}
