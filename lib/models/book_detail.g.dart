// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetail _$BookDetailFromJson(Map<String, dynamic> json) {
  return BookDetail(
    json['book'] == null
        ? null
        : Book.fromJson(json['book'] as Map<String, dynamic>),
    json['book_hosts'] == null
        ? null
        : Book_hosts.fromJson(json['book_hosts'] as Map<String, dynamic>),
    json['request_id'] as String,
  );
}

Map<String, dynamic> _$BookDetailToJson(BookDetail instance) =>
    <String, dynamic>{
      'book': instance.book,
      'book_hosts': instance.bookHosts,
      'request_id': instance.requestId,
    };

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    json['id'] as String,
    json['name'] as String,
    json['intro'] as String,
    json['grade'] as String,
    json['image'] as String,
    json['cover'] as String,
    json['word_count'] as String,
    json['keywords'] as String,
    json['keywords_count'] as String,
    json['word_count_dis'] as String,
    json['topics'] as String,
    json['sentence'] as String,
    json['page_count'] as String,
    json['score'] as String,
    json['pack_url'] as String,
    json['pack_md5'] as String,
    json['show_content'] as String,
    json['is_free'] as int,
    json['is_new'] as int,
    json['tag'] as int,
    json['favourite'] as String,
    json['read_over'] as String,
    json['open_flag'] as String,
    json['quiz_flag'] as String,
    json['lesson_id'] as String,
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'intro': instance.intro,
      'grade': instance.grade,
      'image': instance.image,
      'cover': instance.cover,
      'word_count': instance.wordCount,
      'keywords': instance.keywords,
      'keywords_count': instance.keywordsCount,
      'word_count_dis': instance.wordCountDis,
      'topics': instance.topics,
      'sentence': instance.sentence,
      'page_count': instance.pageCount,
      'score': instance.score,
      'pack_url': instance.packUrl,
      'pack_md5': instance.packMd5,
      'show_content': instance.showContent,
      'is_free': instance.isFree,
      'is_new': instance.isNew,
      'tag': instance.tag,
      'favourite': instance.favourite,
      'read_over': instance.readOver,
      'open_flag': instance.openFlag,
      'quiz_flag': instance.quizFlag,
      'lesson_id': instance.lessonId,
    };

Book_hosts _$Book_hostsFromJson(Map<String, dynamic> json) {
  return Book_hosts(
    json['book_cover'] as String,
    json['book_pack'] as String,
  );
}

Map<String, dynamic> _$Book_hostsToJson(Book_hosts instance) =>
    <String, dynamic>{
      'book_cover': instance.bookCover,
      'book_pack': instance.bookPack,
    };
