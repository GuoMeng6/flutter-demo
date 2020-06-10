import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_demo4/models/book_page/book_page.dart';
import 'package:flutter_demo4/models/book_reading_info.dart';
import 'package:toast/toast.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import '../../../api/api.dart';
import '../../../models/book_detail.dart';
import '../../../utils/utils.dart';
import 'action.dart';
import 'state.dart';

void downloadCallback(String id, DownloadTaskStatus status, int progress) {
  final SendPort send =
      IsolateNameServer.lookupPortByName('downloader_send_port');
  send.send([id, status, progress]);
}

void registPort(Context<PageCoverState> ctx) {
  IsolateNameServer.registerPortWithName(
      ctx.state.port.sendPort, 'downloader_send_port');
  ctx.state.port.listen((dynamic data) {
    String id = data[0];
    DownloadTaskStatus status = data[1];
    int progress = data[2];
    if (status == DownloadTaskStatus.running) {
      ctx.dispatch(PageCoverActionCreator.onSetProgress(progress));
      ctx.dispatch(PageCoverActionCreator.onSetLoading(true));
      if (progress == 100) {
        ctx.dispatch(PageCoverActionCreator.onDownloadComplete());
      }
    }
    if (status == DownloadTaskStatus.complete ||
        status == DownloadTaskStatus.failed) {
      ctx.dispatch(PageCoverActionCreator.onSetProgress(0));
      ctx.dispatch(PageCoverActionCreator.onSetLoading(false));
    }
    print('Download task ($id) is in status ($status) and process ($progress)');
  });
}

Effect<PageCoverState> buildEffect() {
  return combineEffects(<Object, Effect<PageCoverState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    PageCoverAction.action: _onAction,
    PageCoverAction.getBookDetail: _onGetBookDetail,
    PageCoverAction.pressRead: _onPressRead,
    PageCoverAction.downloadComplete: _onDownloadComplete,
    PageCoverAction.pushToBookReading: _onPushToBookReading,
  });
}

void _onAction(Action action, Context<PageCoverState> ctx) {}

void _init(Action action, Context<PageCoverState> ctx) {
  ctx.dispatch(PageCoverActionCreator.onGetBookDetail(ctx.state.bookItem.id));
  try {
    FlutterDownloader.initialize();
  } catch (e) {}

  registPort(ctx);
}

void _dispose(Action action, Context<PageCoverState> ctx) {
  IsolateNameServer.removePortNameMapping('downloader_send_port');
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

  final path = await Utils.getExternalStoragePath();
  print("========= directory ======== ${path}");

  print(
      "========= url ========== ${bookDetail.bookHosts.bookPack}${bookDetail.book.packUrl}");
  FlutterDownloader.registerCallback(downloadCallback);
  final taskId = await FlutterDownloader.enqueue(
    url: "${bookDetail.bookHosts.bookPack}${bookDetail.book.packUrl}",
    savedDir: path,
    showNotification:
        true, // show download progress in status bar (for Android)
    openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
  );
}

void _onDownloadComplete(Action action, Context<PageCoverState> ctx) async {
  BookDetail bookDetail = ctx.state.bookDetail;
  print("========= _onDownloadComplete =========${bookDetail.book.toJson()}");
  final path = await Utils.getExternalStoragePath();
  final bytes =
      File("${path}/book_${bookDetail.book.id}.zip").readAsBytesSync();
  final bookPath = "${path}/book_${bookDetail.book.id}";
  final archive = ZipDecoder().decodeBytes(bytes);
  for (final file in archive) {
    final filename = file.name;
    if (file.isFile) {
      final data = file.content as List<int>;
      File(bookPath + "/" + filename)
        ..createSync(recursive: true)
        ..writeAsBytesSync(data);
    } else {
      Directory(bookPath + "/" + filename)..create(recursive: true);
    }
  }
  String bookJson = await new File("$bookPath/book.json").readAsString();
  print("========= bookJson ========== $bookJson");
  List list = json.decode(bookJson);
  List<BookPage> list2 = list.map((item) => BookPage.fromJson(item)).toList();
  Map<String, dynamic> map = new HashMap();
  map["bookId"] = bookDetail.book.id;
  map["data"] = list2;
//  map["boookDetail"] = bookDetail;
  ctx.dispatch(PageCoverActionCreator.onPushToBookReading(map));
}

void _onPushToBookReading(Action action, Context<PageCoverState> ctx) {
  Navigator.pushNamed(ctx.context, "reading", arguments: action.payload);
}