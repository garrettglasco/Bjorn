////
////  ForgeView.swift
////  Bjorn
////
////  Created by gmac on 10/21/25.
////
//import FirebaseFirestore
//import SwiftUI
//
//struct ForgeView2: View {
//    @StateObject var viewModel = ForgeViewModel()
//    @FirestoreQuery var exercises: [Exercise]
//    
//    private let userId: String
//    
//    init(userId: String) {
//        self.userId = userId
//        self._exercises = FirestoreQuery(
//            collectionPath: "users/\(userId)/exercises"
//        )
//    }
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                Text("Your stuff")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.bottom, 40)
//
//                List(exercises) { exercise in
//                    ExerciseItemView(exercise: exercise)
//                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
//                            Button("Modify") {
//                                // TODO: Handle edit action for this exercise
//                            }
//                            .tint(.blue)
//
//                            Button(role: .destructive) {
//                                // TODO: Handle delete action for this exercise
//                                viewModel.delete(id: exercise.id)
//                            } label: {
//                                Label("Delete", systemImage: "trash")
//                            }
//                        }
//                }
//                .listStyle(PlainListStyle())
//
//                NavigationLink(destination: NewExerciseView()) {
//                    Label("Create a new exercise", systemImage: "bolt.fill")
//                        .font(.headline)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue.opacity(0.8))
//                        .foregroundColor(.white)
//                        .cornerRadius(12)
//                }
////                Spacer()
//
//                // Second Navigation Link
//                List(exercises) { exercise in
//                    ExerciseItemView(exercise: exercise)
//                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
//                            Button("Modify") {
//                                // TODO: Handle edit action for this exercise
//                            }
//                            .tint(.blue)
//
//                            Button(role: .destructive) {
//                                // TODO: Handle delete action for this exercise
//                                viewModel.delete(id: exercise.id)
//                            } label: {
//                                Label("Delete", systemImage: "trash")
//                            }
//                        }
//                }
//                .listStyle(PlainListStyle())
//
//                NavigationLink(destination: NewExerciseView()) {
//                    Label("Create a new exercise", systemImage: "bolt.fill")
//                        .font(.headline)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue.opacity(0.8))
//                        .foregroundColor(.white)
//                        .cornerRadius(12)
//                }
//
////                Spacer()
////                NavigationLink(destination: InventoryView()) {
////                    Label("Open Workouts", systemImage: "hammer.fill")
////                        .font(.headline)
////                        .padding()
////                        .frame(maxWidth: .infinity)
////                        .background(Color.orange.opacity(0.8))
////                        .foregroundColor(.white)
////                        .cornerRadius(12)
////                }
//
//                Spacer()
//            }
//            .padding()
////            .navigationTitle("Forge")
//        }
//    }
//}
//
//
//// Example destination views
//struct WorkoutView: View {
//    var body: some View {
//        Text("Workout Page 🏋️‍♂️")
//            .font(.title)
//    }
//}
//
//struct InventoryView: View {
//    var body: some View {
//        Text("Inventory Page ⚒️")
//            .font(.title)
//    }
//}
//
//#Preview {
//    ForgeView2(userId: "49Q4re5RHGUmosnTywEuT7dIelG3")
//}
