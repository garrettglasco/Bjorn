//
//  ForgeViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import Foundation
import SwiftUI
import Combine
import FirebaseAuth

class ForgeViewModel: ObservableObject {
    @Published var userId: String = ""
    @Published var exercises: [Exercise] = []
    @Published var workout: [Workout] = []

    
    init() {}
    
    func delete(id: String) {
        
    }
}
