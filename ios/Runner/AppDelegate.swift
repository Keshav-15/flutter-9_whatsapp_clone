import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let channelName = "com.example.locale"
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Register any generated plugins.
    GeneratedPluginRegistrant.register(with: self)
    
    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not a FlutterViewController")
    }
    
    let localeChannel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)
    
    localeChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      let defaults = UserDefaults.standard
      switch call.method {
      case "getKey":
        if let args = call.arguments as? [String: Any],
           let key = args["key"] as? String {
          let value = defaults.string(forKey: key)
          result(value)
        } else {
          result(FlutterError(code: "INVALID_ARGUMENTS", message: "Key is required", details: nil))
        }
      case "setKey":
        if let args = call.arguments as? [String: Any],
           let key = args["key"] as? String,
           let value = args["value"] as? String {
          defaults.set(value, forKey: key)
          result(nil)
        } else {
          result(FlutterError(code: "INVALID_ARGUMENTS", message: "Key and value are required", details: nil))
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
