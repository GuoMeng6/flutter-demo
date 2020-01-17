// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookPage _$BookPageFromJson(Map<String, dynamic> json) {
  return BookPage(
    json['course_id'] as String,
    json['is_quiz'] as String,
    json['id'] as String,
    json['mode'] as String,
    json['title'] as String,
    json['pdf_parameters'] as String,
    json['passage_type'] as String,
    json['pdf_content'] as String,
    json['pdf_pic'] as String,
    json['pdf_sound'] as String,
    json['properties'] as String,
    json['sort_index'] as String,
  );
}

Map<String, dynamic> _$BookPageToJson(BookPage instance) => <String, dynamic>{
      'course_id': instance.courseId,
      'is_quiz': instance.isQuiz,
      'id': instance.id,
      'mode': instance.mode,
      'title': instance.title,
      'pdf_parameters': instance.pdfParameters,
      'passage_type': instance.passageType,
      'pdf_content': instance.pdfContent,
      'pdf_pic': instance.pdfPic,
      'pdf_sound': instance.pdfSound,
      'properties': instance.properties,
      'sort_index': instance.sortIndex,
    };
