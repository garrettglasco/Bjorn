//
//  Extensions.swift
//  ToDoList
//
//  Created by gmac on 10/15/25.
//

import SwiftUI
import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        do {
            let encoder = JSONEncoder()
            var data = try encoder.encode(self)
            
            // Decode to object
            var object = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
            
            // Remove Firestore-managed properties
            object.removeValue(forKey: "id")
            return object
        } catch {
            print("⚠️ Encoding failed:", error)
            return [:]
        }
    }
}



public extension Color {
    static let deepIndigo   = Color(red: 58.0/255.0,  green: 12.0/255.0,  blue: 163.0/255.0, opacity: 1.0)
    static let purpleGlow   = Color(red: 114.0/255.0, green: 9.0/255.0,   blue: 183.0/255.0, opacity: 1.0)
    static let electricBlue = Color(red: 67.0/255.0,  green: 97.0/255.0,  blue: 238.0/255.0, opacity: 1.0)
    static let skyTint      = Color(red: 76.0/255.0,  green: 201.0/255.0, blue: 240.0/255.0, opacity: 1.0)
    static let charcoal     = Color(red: 30.0/255.0,  green: 30.0/255.0,  blue: 46.0/255.0,  opacity: 1.0)
    static let deep         = Color(red: 18.0/255.0,  green: 34.0/255.0,  blue: 56.0/255.0,  opacity: 1.0)
}
