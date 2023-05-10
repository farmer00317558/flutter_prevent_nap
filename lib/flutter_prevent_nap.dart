import 'flutter_prevent_nap_platform_interface.dart';

class FlutterPreventNap {
  Future<String> beginActivity(String? reason) {
    return FlutterPreventNapPlatform.instance.beginActivity(reason);
  }

  Future<bool> endActivity(String key) {
    return FlutterPreventNapPlatform.instance.endActivity(key);
  }
}
