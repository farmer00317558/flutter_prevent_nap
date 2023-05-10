import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_prevent_nap_method_channel.dart';

abstract class FlutterPreventNapPlatform extends PlatformInterface {
  /// Constructs a FlutterPreventNapPlatform.
  FlutterPreventNapPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPreventNapPlatform _instance = MethodChannelFlutterPreventNap();

  /// The default instance of [FlutterPreventNapPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPreventNap].
  static FlutterPreventNapPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPreventNapPlatform] when
  /// they register themselves.
  static set instance(FlutterPreventNapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> beginActivity(String? reason) {
    throw UnimplementedError('beginActivity() has not been implemented.');
  }

  Future<bool> endActivity(String activityKey) {
    throw UnimplementedError('endActivity() has not been implemented.');
  }
}
