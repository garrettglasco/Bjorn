//
//  NewExerciseViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import SwiftUI
import Combine
import FirebaseAuth
import FirebaseFirestore

class NewExerciseViewModel: ObservableObject {
    @Published var name = ""
    @Published var notes = ""
    @Published var category = ""
    @Published var showAlert = false

    init() {
        
    }
    
    // Reset form after saving
    func resetFields() {
        name = ""
        notes = ""
        category = ""
    }
    
    func saveExercise() {
        guard canSave else { return }
        // TODO: Implement save logic to Firestore here
        
        //Get UserId
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create Model
        let newId = UUID().uuidString
        let newExercise = Exercise(
            id: newId,
            userId: userId,
            name: name,
            notes: notes.isEmpty ? nil : notes,
            category: category.isEmpty ? nil : category
        )
        
        //Save Model
        let data = newExercise.asDictionary()
        print("🔥 Exercise dictionary:", data)

        let db = Firestore.firestore()
            db.collection("users")
            .document(userId)
            .collection("exercises")
            .document(newId)
            .setData(newExercise.asDictionary())
            print("Exercise Saved")
        }
    
    var canSave: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

