import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import '../local/local-storage.dart';

class Utils {

  static String filePath = '';

  static getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    String device = "Web|macOS|Windows";
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        device = androidInfo.androidId;
        LocalStorage.save("idfv", device);
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        device = iosInfo.identifierForVendor;
        LocalStorage.save("idfv", iosInfo.identifierForVendor);
      }else{
        LocalStorage.save("idfv", device);
      }
    } catch(e){
      LocalStorage.save("idfv", device);
    };
    return device;
  }

  // 申请权限
  static Future<bool> checkPermission(PermissionGroup group) async {
    // 判断是否是android设备
    if (Platform.isAndroid) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(group);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([group]);
        if (permissions[group] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  static getExternalStoragePath() async {
    print("======== getExternalStorageDirectory ======== ");
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    filePath = directory.path;
    return directory.path;
  }

}