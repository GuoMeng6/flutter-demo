import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../api/api.dart';
import '../../../models/book_detail.dart';
import '../../../utils/utils.dart';
import 'action.dart';
import 'state.dart';

Effect<PageCoverState> buildEffect() {
  return combineEffects(<Object, Effect<PageCoverState>>{
    Lifecycle.initState: _init,
    PageCoverAction.action: _onAction,
    PageCoverAction.getBookDetail: _onGetBookDetail,
    PageCoverAction.pressRead: _onPressRead,
  });
}

void _onAction(Action action, Context<PageCoverState> ctx) {}

void _init(Action action, Context<PageCoverState> ctx) {
  ctx.dispatch(PageCoverActionCreator.onGetBookDetail(ctx.state.bookItem.id));
}

void _onGetBookDetail(Action action, Context<PageCoverState> ctx) async {
  String res = await Api.getBookDetail(action.payload);
  Map<String, dynamic> bookRes = json.decode(res);
  if (bookRes["msg"] == "Success") {
    BookDetail bookDetail = BookDetail.fromJson(bookRes["result"]);
    print("======= bookDetail ====== ${bookDetail.toJson()}");
    ctx.dispatch(PageCoverActionCreator.onSetBookDetail(bookDetail));
  }
}

void _onPressRead(Action action, Context<PageCoverState> ctx) async {
  BookDetail bookDetail = action.payload;
  print("=========== _onPressRead ========= ${bookDetail.book.toJson()}");
  // 校验文件读写权限
  bool permission = await Utils.checkPermission(PermissionGroup.storage);
  if (!permission) {
    Toast.show("请允许使用存储空间权限", ctx.context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return;
  }

}
