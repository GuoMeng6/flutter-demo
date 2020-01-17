import 'package:json_annotation/json_annotation.dart';

part 'book_page.g.dart';


@JsonSerializable()
class BookPage extends Object {

  @JsonKey(name: 'course_id')
  String courseId;

  @JsonKey(name: 'is_quiz')
  String isQuiz;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'mode')
  String mode;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'pdf_parameters')
  String pdfParameters;

  @JsonKey(name: 'passage_type')
  String passageType;

  @JsonKey(name: 'pdf_content')
  String pdfContent;

  @JsonKey(name: 'pdf_pic')
  String pdfPic;

  @JsonKey(name: 'pdf_sound')
  String pdfSound;

  @JsonKey(name: 'properties')
  String properties;

  @JsonKey(name: 'sort_index')
  String sortIndex;

  BookPage(this.courseId,this.isQuiz,this.id,this.mode,this.title,this.pdfParameters,this.passageType,this.pdfContent,this.pdfPic,this.pdfSound,this.properties,this.sortIndex,);

  factory BookPage.fromJson(Map<String, dynamic> srcJson) => _$BookPageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BookPageToJson(this);

}


