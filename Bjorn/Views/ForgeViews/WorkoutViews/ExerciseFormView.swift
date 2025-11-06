import SwiftUI
import FirebaseFirestore

struct ExerciseFormView: View {
    @Binding var exerciseForm: ExerciseForm
    var exerciseIndex: Int
    var exercises: [Exercise]
    var integerFormatter: NumberFormatter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            // ──────────────── Exercise Picker ────────────────
            HStack {
                Text("Exercise")
                    .frame(width: 100, alignment: .leading)
                
                Picker("Exercise \(exerciseIndex)", selection: $exerciseForm.exerciseId) {
                    Text("Select Exercise").tag("")
                    ForEach(exercises) { exercise in
                        Text(exercise.name).tag(exercise.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            Divider()
                .padding(.horizontal, 8)
            
            // ──────────────── Sets Count ────────────────
            HStack {
                Text("Sets")
                    .frame(width: 100, alignment: .leading)
                
                TextField("Num", value: $exerciseForm.setNum, formatter: integerFormatter)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer() // pushes the set field to the left
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal, 8)
            
            // ──────────────── Individual Sets ────────────────
            if exerciseForm.setNum > 0 {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<exerciseForm.setNum, id: \.self) { index in
                        HStack {
                            // Left side: Set label
                            Text("Set \(index + 1)")
                                .font(.headline)
                            
                            Spacer() // pushes the right section away
                            
                            // Right side: Reps / Weight / Rest
                            HStack(spacing: 4) {
                                // Reps
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Reps")
                                        .lineLimit(1)
                                        .fixedSize()

                                    TextField("", value: $exerciseForm.repNum[index], formatter: integerFormatter)
                                        .keyboardType(.numberPad)
                                        .frame(width: 50)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                                
                                // Weight
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Weight")
                                        .lineLimit(1)
                                        .fixedSize()

                                    TextField("", value: $exerciseForm.weightVal[index], formatter: integerFormatter)
                                        .keyboardType(.numberPad)
                                        .frame(width: 50)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                                
                                // Rest
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Rest")
                                        .lineLimit(1)
                                        .fixedSize()

                                    TextField("", value: $exerciseForm.restVal[index], formatter: integerFormatter)
                                        .keyboardType(.numberPad)
                                        .frame(width: 50)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                            }
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 10)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
