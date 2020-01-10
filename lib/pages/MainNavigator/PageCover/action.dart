import 'package:fish_redux/fish_redux.dart';

import '../../../models/book_detail.dart';

//TODO replace with your own action
enum PageCoverAction { action, getBookDetail, setBookDetail, pressRead }

class PageCoverActionCreator {
  static Action onAction() {
    return const Action(PageCoverAction.action);
  }

  static Action onGetBookDetail(String bookId) {
    return Action(PageCoverAction.getBookDetail, payload: bookId);
  }

  static Action onSetBookDetail(BookDetail bookDetail) {
    return Action(PageCoverAction.setBookDetail, payload: bookDetail);
  }

  static Action onPressRead(BookDetail bookDetail) {
    return Action(PageCoverAction.pressRead, payload: bookDetail);
  }
}
