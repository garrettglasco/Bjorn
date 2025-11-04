//
//  BjornApp.swift
//  Bjorn
//
//  Created by gmac on 10/20/25.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                  MainView()
              }
        }
    }
}
