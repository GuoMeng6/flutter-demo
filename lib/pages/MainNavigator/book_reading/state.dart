import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo4/models/book_page/book_page.dart';

class BookReadingState implements Cloneable<BookReadingState> {
  List<BookPage> data;
  String bookId;
  int index = 0;

  @override
  BookReadingState clone() {
    return BookReadingState()
      ..data = data
      ..bookId = bookId
      ..index = index;
  }
}

BookReadingState initState(Map<String, dynamic> args) {
  final bookId = args["bookId"];
  final List<BookPage> data = args["data"];
  final BookReadingState state = BookReadingState();
  state.bookId = bookId ?? "";
  state.data = data ?? [];
  return state;
}
