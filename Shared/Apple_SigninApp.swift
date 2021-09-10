//
//  Apple_SigninApp.swift
//  Shared
//
//  Created by Michele Manniello on 10/09/21.
//

import SwiftUI
import Firebase
@main
struct Apple_SigninApp: App {
//    Calling Delegate...
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
//Initializing Firebase...
class AppDelegate: NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
