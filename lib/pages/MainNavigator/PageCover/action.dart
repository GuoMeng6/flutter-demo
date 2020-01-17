import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo4/models/book_reading_info.dart';

import '../../../models/book_detail.dart';

//TODO replace with your own action
enum PageCoverAction { action, getBookDetail, setBookDetail, pressRead,
  setProgress, setLoading, downloadComplete, pushToBookReading }

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

  static Action onSetProgress(num progress) {
    return Action(PageCoverAction.setProgress, payload: progress);
  }

  static Action onSetLoading(bool loading) {
    return Action(PageCoverAction.setLoading, payload: loading);
  }

  static Action onDownloadComplete(){
    return Action(PageCoverAction.downloadComplete);
  }

  static Action onPushToBookReading(Map<String, dynamic> args){
    return Action(PageCoverAction.pushToBookReading, payload: args);
  }
}
