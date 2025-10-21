//
//  Extensions.swift
//  ToDoList
//
//  Created by gmac on 10/15/25.
//

import SwiftUI

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }
        catch {
            return [:]
        }
    }
}
