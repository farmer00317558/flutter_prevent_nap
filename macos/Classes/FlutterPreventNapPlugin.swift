import Cocoa
import FlutterMacOS

public class FlutterPreventNapPlugin: NSObject, FlutterPlugin {
  var activities: [String: Any] = [:]

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_prevent_nap", binaryMessenger: registrar.messenger)
    let instance = FlutterPreventNapPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? Dictionary<String, Any> else {
      result(FlutterError(code: "InvalidArguments", message: "Invalid arguments, expected dictionary.", details: nil))
      return
    }
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "beginActivity":
      let reason = args["reason"] ?? "Prevent nap to do an important task."
      let key = UUID().uuidString
      let activity = ProcessInfo.beginActivity()
      activities[key] = activity
      result(key)
    case "endActivity":
      if let activity = activities[key] as? AnyHashable {
        ProcessInfo.endActivity(activity)
        activities[key] = nil 
        result(true)
      }
      result(FlutterError(code: "Unknown Activity", message: nil, details: nil))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
