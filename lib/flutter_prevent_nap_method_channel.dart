import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_prevent_nap_platform_interface.dart';

/// An implementation of [FlutterPreventNapPlatform] that uses method channels.
class MethodChannelFlutterPreventNap extends FlutterPreventNapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_prevent_nap');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> beginActivity(String? reason) async {
    final activityKey = await methodChannel.invokeMethod<String>(
      'beginActivity',
      reason,
    );
    return activityKey!;
  }

  @override
  Future<bool> endActivity(String activityKey) async {
    final ret = await methodChannel.invokeMethod<bool>(
      'endActivity',
      activityKey,
    );
    return ret!;
  }
}
