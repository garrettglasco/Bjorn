//
//  ExersiceViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseAuth

class ExerciseViewModel: ObservableObject {
    //@Published var userId: String = ""
    @Published var exercises: [Exercise] = []
        
    init() {}    
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document("user_id")
            .collection("exercises")
            .document(id)
            .delete()
    }
}

