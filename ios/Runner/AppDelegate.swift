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
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyAfbxHPjQ_PlRCzzvKRPqaoc55uh4DNEvQ")
    configureAudioSession()

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func configureAudioSession() {
      let audioSession = AVAudioSession.sharedInstance()
      do {
          // Set the audio session category for recording and playback
          try audioSession.setCategory(.playAndRecord, options: [.defaultToSpeaker, .mixWithOthers])
          try audioSession.setActive(true)
          print("Audio session configured successfully")
      } catch {
          print("Failed to configure audio session: \(error.localizedDescription)")
      }
  }
}
