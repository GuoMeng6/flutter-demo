import 'dart:collection';

import 'http-manager.dart';

class Api {
  static String hosts = "http://121.40.208.38:8500/api/v1";

  static getUserInfo() async {
    Map<String, dynamic> map = new HashMap();
    return httpManager.get('/user/info', map);
  }

  /**
   * 获取图书列表
   * page: 第几页
   * size: 每页个数
   * grade: 年级
   */
  static getBookShelf(int page, int size, int grade) async {
    Map<String, dynamic> map = new HashMap();
    map['page'] = page;
    map['size'] = size;
    map['grade'] = "K$grade";
    map['read_flag'] = 0;
    return httpManager.get('/book/list/byGrade', map);
  }

  static getBookDetail(String bookId) {
    Map<String, dynamic> map = new HashMap();
    map["book_id"] = bookId;
    map["type_id"] = "0";
    return httpManager.get("/book/detail", map);
  }
}
