import 'package:equatable/equatable.dart';
import 'package:word_prime/base/base_model.dart';

class AddedWordModel extends BaseModel<AddedWordModel> with EquatableMixin {
  String? addedWordId;
  String? wordImageAddress;
  String? wordEn;
  String? wordTr;
  String? wordLevel;

  AddedWordModel({
    this.addedWordId,
    this.wordImageAddress,
    this.wordEn,
    this.wordTr,
    this.wordLevel,
  });

  @override
  List<Object?> get props =>
      [addedWordId, wordImageAddress, wordEn, wordTr, wordLevel];

  AddedWordModel copyWith({
    String? addedWordId,
    String? wordImageAddress,
    String? wordEn,
    String? wordTr,
    String? wordLevel,
  }) {
    return AddedWordModel(
      addedWordId: addedWordId ?? this.addedWordId,
      wordImageAddress: wordImageAddress ?? this.wordImageAddress,
      wordEn: wordEn ?? this.wordEn,
      wordTr: wordTr ?? this.wordTr,
      wordLevel: wordLevel ?? this.wordLevel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'added_word_id': addedWordId,
      'word_image_address': wordImageAddress,
      'word_en': wordEn,
      'word_tr': wordTr,
      'word_level': wordLevel,
    };
  }

  @override
  AddedWordModel fromJson(Map<String, dynamic> json) {
    return AddedWordModel(
      addedWordId: json['added_word_id'] as String?,
      wordImageAddress: json['word_image_address'] as String?,
      wordEn: json['word_en'] as String?,
      wordTr: json['word_tr'] as String?,
      wordLevel: json['word_level'] as String?,
    );
  }
}
