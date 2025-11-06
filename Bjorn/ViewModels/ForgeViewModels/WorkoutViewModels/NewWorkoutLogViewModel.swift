//
//  NewWorkoutLogViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import Foundation
import Combine
import FirebaseFirestore

struct ExerciseForm: Identifiable {
    var id = UUID().uuidString
    var exerciseId: String
    var setNum: Int {
        didSet {
            syncArrays()
        }
    }
    var weightVal: [Int]
    var repNum: [Int]
    var restVal: [Int]
    
    init(
        exerciseId: String = "",
        setNum: Int = 0,
        repNum: [Int] = [],
        weightVal: [Int] = [],
        restVal: [Int] = []
    ) {
        self.exerciseId = exerciseId
        self.setNum = setNum
        self.repNum = repNum
        self.weightVal = weightVal
        self.restVal = restVal
        syncArrays()
    }
    
    mutating func syncArrays() {
        // Adjust all arrays to match setsNum
        if repNum.count != setNum {
            repNum = Array(repeating: 0, count: setNum)
        }
        if weightVal.count != setNum {
            weightVal = Array(repeating: 0, count: setNum)
        }
        if restVal.count != setNum {
            restVal = Array(repeating: 0, count: setNum)
        }
    }
}


class NewWorkoutLogViewModel: ObservableObject {
    @Published var userId: String = ""
    @Published var workoutName: String = ""
    @Published var split: String = ""
    @Published var notes: String = ""
    @Published var dateCreated: Date = Date()
    
    @Published var exerciseForms: [ExerciseForm] = []
    
    
    // Set-related data
    @Published var setsNum: Int = 0 {
        didSet {
            updateSetArrays()
        }
    }
    @Published var repsNums: [Int] = []
    @Published var weightVals: [Int] = []
    @Published var restTimes: [Int] = []

    private let db = Firestore.firestore()
    
    init() {}

    private func updateSetArrays() {
        repsNums = Array(repeating: 0, count: setsNum)
        weightVals = Array(repeating: 0, count: setsNum)
        restTimes = Array(repeating: 0, count: setsNum)
    }

    func addExerciseForm() {
        exerciseForms.append(ExerciseForm())
    }
    
    func updateExerciseName(at index: Int, to name: String) {
        guard exerciseForms.indices.contains(index) else { return }
        exerciseForms[index].exerciseId = name
    }
    
    func updateRep(at exerciseIndex: Int, set setIndex: Int, to reps: Int) {
        guard exerciseForms.indices.contains(exerciseIndex) else { return }
        guard exerciseForms[exerciseIndex].repNum.indices.contains(setIndex) else { return }
        exerciseForms[exerciseIndex].repNum[setIndex] = max(0, reps)
    }
    
    func updateRest(at exerciseIndex: Int, set setIndex: Int, to restSeconds: Int) {
        guard exerciseForms.indices.contains(exerciseIndex) else { return }
        guard exerciseForms[exerciseIndex].restVal.indices.contains(setIndex) else { return }
        exerciseForms[exerciseIndex].restVal[setIndex] = max(0, restSeconds)
    }
    
    func save() {
        guard !workoutName.isEmpty else { return }
        
        // 1. Create a Workout
        let workoutId = UUID().uuidString
        let workout = Workout(
            id: workoutId,
            userId: userId,
            name: workoutName,
            split: split,
            createdAt: dateCreated,
        )
        
        let workoutRef = db.collection("users")
            .document(userId)
            .collection("workouts")
            .document(workoutId)
        
        do {
            try workoutRef.setData(from: workout)
        } catch {
            print("❌ Error saving workoutLog: \(error)")
            return
        }
        
        // 2. Add each exercise + set as WorkDetail
        for exerciseForm in exerciseForms {
            guard !exerciseForm.exerciseId.isEmpty else { continue }
            
            for setIndex in 0..<exerciseForm.setNum {
                let detailId = UUID().uuidString
                let detail = WorkoutDetail(
                    id: detailId,
                    workoutId: workoutId,
                    exerciseId: exerciseForm.exerciseId,
                    weight: Double(exerciseForm.weightVal[setIndex]),
                    SetNum: exerciseForm.setNum,
                    repNum: exerciseForm.repNum[setIndex],
                    restVal: exerciseForm.restVal[setIndex]
                )
                
                do {
                    try workoutRef
                        .collection("workDetails")
                        .document(detailId)
                        .setData(from: detail)
                } catch {
                    print("❌ Error saving workDetail: \(error)")
                }
            }
        }
        
        print("✅ Workout saved successfully to Firestore")
    }

}
