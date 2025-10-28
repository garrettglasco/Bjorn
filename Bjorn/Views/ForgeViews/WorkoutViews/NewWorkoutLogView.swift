//
//  NewWorkoutLog.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//
import SwiftUI
import FirebaseFirestore

struct NewWorkoutLogView: View {
    @StateObject var viewModel = NewWorkoutLogViewModel()

    @FirestoreQuery var exercises: [Exercise]

//    @Binding var NewLogPresented: Bool
    
    private var integerFormatter: NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .none
        return f
    }
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._exercises = FirestoreQuery(
            collectionPath: "users/\(userId)/exercises"
        )
    }
    
    var body: some View {
        VStack {
            Text("New Workout")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 100)
            
            Form {
                //Workout Name
                TextField("Workout Name", text: $viewModel.workoutName)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                
                // Exercise Picker
                Picker("Exercise", selection: $viewModel.exerciseName) {
                    ForEach(exercises) { exercise in
                        Text(exercise.name)
                            .tag(exercise.name)
                    }
                }
                .pickerStyle(MenuPickerStyle()) // or .wheel/.segmented depending on your UI
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

                
                //Sets
                TextField("Sets", value: $viewModel.sets, formatter: integerFormatter)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //Reps
                TextField("Reps", value: $viewModel.reps, formatter: integerFormatter)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //RestTime
                TextField("Rest Time (sec)", value: $viewModel.restTime, formatter: integerFormatter)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
                //Date
//                DatePicker("Date", selection: $viewModel.dateCreated)
//                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save",
                         backgroundColor: .pink) {
                    viewModel.save()
//                    NewLogPresented.toggle()
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewWorkoutLogView(
        userId: "49Q4re5RHGUmosnTywEuT7dIelG3"
    )
}
