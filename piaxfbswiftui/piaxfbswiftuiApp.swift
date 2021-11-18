//
//  piaxfbswiftuiApp.swift
//  piaxfbswiftui
//
//  Created by Bill Martensson on 2021-11-18.
//

import SwiftUI
import Firebase

@main
struct piaxfbswiftuiApp: App {
    
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ShoppingView()
        }
    }
}
