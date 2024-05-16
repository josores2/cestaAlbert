//
//  cesta_de_la_compraApp.swift
//  cesta de la compra
//
//  Created by Jose on 15/5/24.
//

import SwiftUI
import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
  }
}

@main
struct cesta_de_la_compraApp: App {
    var dB: Void = FirebaseApp.configure()
    
    var body: some Scene {
        WindowGroup {
            
            HolderView().environmentObject(AuthViewModel())
        }
    }
}
