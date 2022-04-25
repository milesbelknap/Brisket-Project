//
//  Brisket_PrototypeApp.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 3/28/22.
//

import SwiftUI
import Firebase

@main
struct Brisket_PrototypeApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    
                    Auth.auth().canHandle(url)
                })
        }
    }
}

//initializing Firebase

class Appdelegate : NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}
