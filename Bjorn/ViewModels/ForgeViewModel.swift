//
//  ForgeViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseAuth

class ForgeViewModel: ObservableObject {
//    @Published var userId: String = ""
    @Published var exercises: [Exercise] = []
    @Published var workout: [Workout] = []

    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteExercise(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(self.userId)
            .collection("exercises")
            .document(id)
            .delete()
    }
    
    func deleteWorkout(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(self.userId)
            .collection("workouts")
            .document(id)
            .delete()
    }
}

