import 'package:flutter_demo4/models/book_page/book_page.dart';

class BookReadingInfo {
  final List<BookPage> data;
  final String bookId;

  BookReadingInfo({this.data, this.bookId});

  String toString() {
    return "<BookReadingInfo> bookId: $bookId";
  }
}
