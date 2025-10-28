//
//  ExerciseView.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//
import FirebaseFirestore
import SwiftUI

struct ExerciseView: View {
    @StateObject var viewModel = ExerciseViewModel()
    @FirestoreQuery var exercises: [Exercise]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._exercises = FirestoreQuery(
            collectionPath: "users/\(userId)/exercises"
        )
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                List(exercises) { exercise in
                    ExerciseItemView(exercise: exercise)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button("Modify") {
                                // TODO: Handle edit action for this exercise
                            }
                            .tint(.blue)

                            Button(role: .destructive) {
                                // TODO: Handle delete action for this exercise
                                viewModel.delete(id: exercise.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                    }
                }
                .listStyle(PlainListStyle())
                
//                Text("Your exercises here")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.bottom, 40)

                // First Navigation Link
                NavigationLink(destination: NewExerciseView()) {
                    Label("Create a new exercise", systemImage: "bolt.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                // List of Exersices

                Spacer()
            }
            .padding()
            .navigationTitle("Your exercises here")
        }
    }
}

#Preview {
    ExerciseView(userId: "49Q4re5RHGUmosnTywEuT7dIelG3")
}

