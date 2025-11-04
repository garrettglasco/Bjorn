import SwiftUI
import FirebaseFirestore

struct NewWorkoutLogView: View {
    @StateObject var viewModel = NewWorkoutLogViewModel()
    @FirestoreQuery var exercises: [Exercise]
    
    private let userId: String
    @State private var selectedExerciseIndex = 0
    
    private let integerFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()
    
    init(userId: String) {
        self.userId = userId
        self._exercises = FirestoreQuery(
            collectionPath: "users/\(userId)/exercises"
        )
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("New Workout")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 50)
            
            Form {
                Section(header: Text("Workout Info")) {
                    TextField("Workout Name", text: $viewModel.workoutName)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical, 8)
                    
                    DatePicker("Date", selection: $viewModel.dateCreated, displayedComponents: .date)
                    
                    TextField("Notes", text: $viewModel.notes, axis: .vertical)
                        .lineLimit(3...6)
                }
                
                // Exercise Tabs
                if !viewModel.exerciseForms.isEmpty {
                    Section(header: Text("Exercises")) {
                        TabView(selection: $selectedExerciseIndex) {
                            ForEach(viewModel.exerciseForms.indices, id: \.self) { index in
                                ScrollView { // Make content scrollable vertically
                                    ExerciseFormView(
                                        exerciseForm: $viewModel.exerciseForms[index],
                                        exercises: exercises,
                                        integerFormatter: integerFormatter
                                    )
                                    .padding()
                                }
                                .tag(index)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        .frame(height: 500) // Taller so scrolling feels natural
                    }
                }
                
                // Add Exercise Button
                Button(action: {
                    viewModel.addExerciseForm()
                    selectedExerciseIndex = viewModel.exerciseForms.count - 1
                }) {
                    Label("Add Exercise", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.borderless)
                .padding(.vertical, 8)
                
                // Save Button
                TLButton(title: "Save Workout", backgroundColor: .pink) {
                    viewModel.save()
                }
                .padding(.vertical, 10)
            }
        }
    }
}

#Preview {
    NewWorkoutLogView(userId: "49Q4re5RHGUmosnTywEuT7dIelG3")
}
