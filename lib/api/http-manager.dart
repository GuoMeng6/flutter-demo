import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_demo4/api/api.dart';
import 'package:flutter_demo4/local/local-storage.dart';
import 'package:flutter_demo4/utils/utils.dart';

class DeviceInfo {
  final String idfv;
  DeviceInfo(this.idfv);
  Map<String, dynamic> toJson() => {'idfv': idfv};
}

class HttpManager {
  Dio dio = new Dio(new BaseOptions(
    baseUrl: Api.hosts,
    connectTimeout: 5000,
    responseType: ResponseType.plain,
  ));

  HttpManager() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options options) async {
      String token = await LocalStorage.get("token");
      token ??= '';
      if (token.isNotEmpty) {
        options.headers["token"] = token;
      }
      String idfv = await LocalStorage.get("idfv");
      idfv ??= '';
      if(idfv.isEmpty){
        idfv = await Utils.getDeviceInfo();
      }
      options.headers["device"] = json.encode(new DeviceInfo(idfv+"111"));
      return options; //continue
    }));
  }

  get(url, queryParameters) async {
    print('即将开启get请求 url = $url  queryParameters = $queryParameters');
    Response response;
    try {
      response = await dio.get(
        url,
        queryParameters: queryParameters,
      );
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  post(url, data) async{
    print('即将开启post请求 url = $url  data = $data');
    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
      );
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }

}

final HttpManager httpManager = new HttpManager();
