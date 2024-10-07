import UIKit
import Flutter
import Firebase
import GoogleMaps
import AVFoundation

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    configureAudioSession()
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyAfbxHPjQ_PlRCzzvKRPqaoc55uh4DNEvQ")

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func configureAudioSession() {
          let session = AVAudioSession.sharedInstance()
          do {
              try session.setCategory(.record, mode: .measurement, options: .duckOthers)
              try session.setActive(true, options: .notifyOthersOnDeactivation)
          } catch {
              print("Failed to set up audio session")
          }
      }
}
