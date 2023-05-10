import Cocoa
import FlutterMacOS

public class FlutterPreventNapPlugin: NSObject, FlutterPlugin {
  var activities: [String: NSObjectProtocol] = [:]

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_prevent_nap", binaryMessenger: registrar.messenger)
    let instance = FlutterPreventNapPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "beginActivity":
      let key = UUID().uuidString
      let reason = call.arguments as? String ?? "Prevent nap to do an important task."
      let activity = ProcessInfo.processInfo.beginActivity(options: [.idleDisplaySleepDisabled, .userInitiated], reason: reason)
      activities[key] = activity
      result(key)
    case "endActivity":
      let key = call.arguments as? String ?? ""
      if let activity = activities[key] {
        ProcessInfo.processInfo.endActivity(activity)
        activities[key] = nil 
        result(true)
        return
      }
      result(FlutterError(code: "Unknown Activity", message: nil, details: nil))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
