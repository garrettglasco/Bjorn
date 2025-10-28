//
//  ExersiceViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import Foundation
import SwiftUI
import Combine
import FirebaseAuth

class ExerciseViewModel: ObservableObject {
    @Published var userId: String = ""
    @Published var exercises: [Exercise] = []
    
    
    init() {}
    
    func delete(id: String) {
        
    }
}

