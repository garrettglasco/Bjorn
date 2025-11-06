import SwiftUI
import FirebaseFirestore

struct ForgeView: View {
    @StateObject var viewModel: ForgeViewModel
    @FirestoreQuery var exercises: [Exercise]
    @FirestoreQuery var workouts: [Workout]
    
    private let userId: String
    @State private var topExpanded = true
    @State private var dragOffset: CGFloat = 0
    
    init(userId: String) {
        self.userId = userId
        self._exercises = FirestoreQuery(
            collectionPath: "users/\(userId)/exercises"
        )
        self._workouts = FirestoreQuery(
            collectionPath: "users/\(userId)/workouts"
        )
        self._viewModel = StateObject(wrappedValue: ForgeViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    
                    // --- Exercise List ---
                    VStack(spacing: 8) {
                        Text("Your Exercises")
                            .font(.headline)
                        
                        List(exercises) { exercise in
                            ExerciseItemView(exercise: exercise)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button("Modify") { }
                                        .tint(.blue)
                                    
                                    Button("Delete") {
                                        viewModel.deleteExercise(id: exercise.id)
                                    }.tint(.red)
                                }
                        }
                        .listStyle(PlainListStyle())
                        
                        NavigationLink(destination: NewExerciseView()) {
                            Label("Create a new exercise", systemImage: "bolt.fill")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    .frame(height: topExpanded
                           ? geo.size.height * 0.7 + dragOffset
                           : geo.size.height * 0.3 + dragOffset)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .shadow(radius: 6)
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: topExpanded)
                    
                    
                    // --- Divider / Handle ---
                    Divider()
                        .background(Color.gray)
                        .frame(height: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.gray.opacity(0.4))
                                .frame(width: 60, height: 6)
                                .padding(4)
                        )
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = value.translation.height / 2
                                }
                                .onEnded { value in
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                        if value.translation.height < -50 {
                                            topExpanded = true
                                        } else if value.translation.height > 50 {
                                            topExpanded = false
                                        }
                                        dragOffset = 0
                                    }
                                }
                        )
                    
                    
                    // --- Workout List ---
                    VStack(spacing: 8) {
//                        Text("Your Workouts")
//                            .font(.headline)
//                        
//                        List(workouts) { workout in
//                            WorkoutItemView(workout: workout)
//                                .listRowSeparator(.hidden)
//                                .listRowBackground(Color.clear)
//                        }
//                        .listStyle(PlainListStyle())
                        
                        NavigationLink(destination: NewWorkoutLogView(userId: self.userId)) {
                            Label("Create a new workout", systemImage: "hammer.fill")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    .frame(height: topExpanded
                           ? geo.size.height * 0.3 - dragOffset
                           : geo.size.height * 0.7 - dragOffset)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .shadow(radius: 6)
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: topExpanded)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

#Preview {
    ForgeView(userId: "49Q4re5RHGUmosnTywEuT7dIelG3")
}
