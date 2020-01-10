import 'package:json_annotation/json_annotation.dart';

part 'book_detail.g.dart';


@JsonSerializable()
class BookDetail extends Object {

  @JsonKey(name: 'book')
  Book book;

  @JsonKey(name: 'book_hosts')
  Book_hosts bookHosts;

  @JsonKey(name: 'request_id')
  String requestId;

  BookDetail(this.book,this.bookHosts,this.requestId,);

  factory BookDetail.fromJson(Map<String, dynamic> srcJson) => _$BookDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BookDetailToJson(this);

}


@JsonSerializable()
class Book extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'intro')
  String intro;

  @JsonKey(name: 'grade')
  String grade;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'word_count')
  String wordCount;

  @JsonKey(name: 'keywords')
  String keywords;

  @JsonKey(name: 'keywords_count')
  String keywordsCount;

  @JsonKey(name: 'word_count_dis')
  String wordCountDis;

  @JsonKey(name: 'topics')
  String topics;

  @JsonKey(name: 'sentence')
  String sentence;

  @JsonKey(name: 'page_count')
  String pageCount;

  @JsonKey(name: 'score')
  String score;

  @JsonKey(name: 'pack_url')
  String packUrl;

  @JsonKey(name: 'pack_md5')
  String packMd5;

  @JsonKey(name: 'show_content')
  String showContent;

  @JsonKey(name: 'is_free')
  int isFree;

  @JsonKey(name: 'is_new')
  int isNew;

  @JsonKey(name: 'tag')
  int tag;

  @JsonKey(name: 'favourite')
  String favourite;

  @JsonKey(name: 'read_over')
  String readOver;

  @JsonKey(name: 'open_flag')
  String openFlag;

  @JsonKey(name: 'quiz_flag')
  String quizFlag;

  @JsonKey(name: 'lesson_id')
  String lessonId;

  Book(this.id,this.name,this.intro,this.grade,this.image,this.cover,this.wordCount,this.keywords,this.keywordsCount,this.wordCountDis,this.topics,this.sentence,this.pageCount,this.score,this.packUrl,this.packMd5,this.showContent,this.isFree,this.isNew,this.tag,this.favourite,this.readOver,this.openFlag,this.quizFlag,this.lessonId,);

  factory Book.fromJson(Map<String, dynamic> srcJson) => _$BookFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BookToJson(this);

}


@JsonSerializable()
class Book_hosts extends Object {

  @JsonKey(name: 'book_cover')
  String bookCover;

  @JsonKey(name: 'book_pack')
  String bookPack;

  Book_hosts(this.bookCover,this.bookPack,);

  factory Book_hosts.fromJson(Map<String, dynamic> srcJson) => _$Book_hostsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Book_hostsToJson(this);

}

