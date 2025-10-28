//
//  NewWorkoutLogViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import Foundation
import Combine

class NewWorkoutLogViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var duedate: Date = Date()
    
    init () {
        
    }
    
    func save() {
        return
    }
}
