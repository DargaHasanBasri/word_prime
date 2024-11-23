import 'package:equatable/equatable.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/models/base_model.dart';

class PostModel extends BaseModel<PostModel> with EquatableMixin {
  String? postId;
  String? wordLevel;
  String? userId;
  int? totalLikes;
  int? totalComments;
  int? totalSaves;
  String? wordTurkish;
  String? wordEnglish;
  String? postImageAddress;
  Timestamp? createdDate;
  Timestamp? updatedDate;
  List<String>? sentenceTurkish;
  List<String>? sentenceEnglish;

  PostModel({
    this.postId,
    this.wordLevel,
    this.userId,
    this.totalLikes,
    this.totalComments,
    this.totalSaves,
    this.wordTurkish,
    this.wordEnglish,
    this.postImageAddress,
    this.createdDate,
    this.updatedDate,
    this.sentenceTurkish,
    this.sentenceEnglish,
  });

  @override
  List<Object?> get props => [
        postId,
        wordLevel,
        userId,
        totalLikes,
        totalComments,
        totalSaves,
        wordTurkish,
        wordEnglish,
        postImageAddress,
        createdDate,
        updatedDate,
        sentenceTurkish,
        sentenceEnglish
      ];

  PostModel copyWith({
    String? postId,
    String? wordLevel,
    String? userId,
    int? totalLikes,
    int? totalComments,
    int? totalSaves,
    String? wordTurkish,
    String? wordEnglish,
    String? postImageAddress,
    Timestamp? createdDate,
    Timestamp? updatedDate,
    List<String>? sentenceTurkish,
    List<String>? sentenceEnglish,
  }) {
    return PostModel(
      postId: postId ?? this.postId,
      wordLevel: wordLevel ?? this.wordLevel,
      userId: userId ?? this.userId,
      totalLikes: totalLikes ?? this.totalLikes,
      totalComments: totalComments ?? this.totalComments,
      totalSaves: totalSaves ?? this.totalSaves,
      wordTurkish: wordTurkish ?? this.wordTurkish,
      wordEnglish: wordEnglish ?? this.wordEnglish,
      postImageAddress: postImageAddress ?? this.postImageAddress,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      sentenceTurkish: sentenceTurkish ?? this.sentenceTurkish,
      sentenceEnglish: sentenceEnglish ?? this.sentenceEnglish,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'post_id': postId,
      'word_level': wordLevel,
      'user_id': userId,
      'total_likes': totalLikes,
      'total_comments': totalComments,
      'total_saves': totalSaves,
      'word_turkish': wordTurkish,
      'word_english': wordEnglish,
      'post_image_address': postImageAddress,
      'created_date': createdDate,
      'updated_date': updatedDate,
      'sentence_turkish': sentenceTurkish,
      'sentence_english': sentenceEnglish,
    };
  }

  @override
  PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: json['post_id'] as String?,
      wordLevel: json['word_level'] as String?,
      userId: json['user_id'] as String?,
      totalLikes: json['total_likes'] as int?,
      totalComments: json['total_comments'] as int?,
      totalSaves: json['total_saves'] as int?,
      wordTurkish: json['word_turkish'] as String?,
      wordEnglish: json['word_english'] as String?,
      postImageAddress: json['post_image_address'] as String?,
      createdDate: json['created_date'] as Timestamp?,
      updatedDate: json['updated_date'] as Timestamp?,
      sentenceTurkish: (json['sentence_turkish'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sentenceEnglish: (json['sentence_english'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}
