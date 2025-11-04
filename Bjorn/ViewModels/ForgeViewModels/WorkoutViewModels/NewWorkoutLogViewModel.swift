//
//  NewWorkoutLogViewModel.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import Foundation
import Combine

struct ExerciseForm: Identifiable {
    var id = UUID().uuidString
    var exerciseName: String
    var setsNum: Int {
        didSet {
            syncArrays()
        }
    }
    var repsNums: [Int]
    var weightVals: [Int]
    var restTimes: [Int]
    
    init(
        exerciseName: String = "",
        setsNum: Int = 0,
        repsNums: [Int] = [],
        weightVals: [Int] = [],
        restTimes: [Int] = []
    ) {
        self.exerciseName = exerciseName
        self.setsNum = setsNum
        self.repsNums = repsNums
        self.weightVals = weightVals
        self.restTimes = restTimes
        syncArrays()
    }
    
    mutating func syncArrays() {
        // Adjust all arrays to match setsNum
        if repsNums.count != setsNum {
            repsNums = Array(repeating: 0, count: setsNum)
        }
        if weightVals.count != setsNum {
            weightVals = Array(repeating: 0, count: setsNum)
        }
        if restTimes.count != setsNum {
            restTimes = Array(repeating: 0, count: setsNum)
        }
    }
}


class NewWorkoutLogViewModel: ObservableObject {
    @Published var userId: String = ""
    @Published var workoutName: String = ""
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
        exerciseForms[index].exerciseName = name
    }
    
//    func updateSetsNum(at index: Int, to sets: Int) {
//        guard exerciseForms.indices.contains(index) else { return }
//        exerciseForms[index].updateSetCount(max(0, sets))
//    }
    
    func updateRep(at exerciseIndex: Int, set setIndex: Int, to reps: Int) {
        guard exerciseForms.indices.contains(exerciseIndex) else { return }
        guard exerciseForms[exerciseIndex].repsNums.indices.contains(setIndex) else { return }
        exerciseForms[exerciseIndex].repsNums[setIndex] = max(0, reps)
    }
    
//    func updateWeight(at exerciseIndex: Int, set setIndex: Int, to weight: Double) {
//        guard exerciseForms.indices.contains(exerciseIndex) else { return }
//        guard exerciseForms[exerciseIndex].weightVals.indices.contains(setIndex) else { return }
//        exerciseForms[exerciseIndex].weightVals[setIndex] = max(0.0, weight)
//    }
    
    func updateRest(at exerciseIndex: Int, set setIndex: Int, to restSeconds: Int) {
        guard exerciseForms.indices.contains(exerciseIndex) else { return }
        guard exerciseForms[exerciseIndex].restTimes.indices.contains(setIndex) else { return }
        exerciseForms[exerciseIndex].restTimes[setIndex] = max(0, restSeconds)
    }
    
    func save() {
        // TODO: Combine workoutName + exerciseForms and save to Firestore
        print("Saving workout:", workoutName)
        for ex in exerciseForms {
            print("Exercise:", ex.exerciseName, "Sets:", ex.setsNum)
        }
    }
}
