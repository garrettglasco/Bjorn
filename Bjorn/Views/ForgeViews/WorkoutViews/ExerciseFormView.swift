import SwiftUI
import FirebaseFirestore

struct ExerciseFormView: View {
    @Binding var exerciseForm: ExerciseForm
    var exercises: [Exercise]
    var integerFormatter: NumberFormatter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            // Exercise Picker
            HStack {
                Text("Exercise")
                    .frame(width: 100, alignment: .leading)
                Picker("Exercise", selection: $exerciseForm.exerciseName) {
                    Text("Select Exercise").tag("")
                    ForEach(exercises) { exercise in
                        Text(exercise.name).tag(exercise.name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            // Number of Sets
            HStack {
                Text("Sets")
                    .frame(width: 100, alignment: .leading)
                TextField("Num", value: $exerciseForm.setsNum, formatter: integerFormatter)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
            }
            
            // Individual Sets
            if exerciseForm.setsNum > 0 {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<exerciseForm.setsNum, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Set \(index + 1)")
                                .font(.headline)
                            
                            HStack(spacing: 10) {
                                // Reps
                                VStack(alignment: .leading) {
                                    Text("Reps")
                                    TextField("", value: $exerciseForm.repsNums[index], formatter: integerFormatter)
                                        .keyboardType(.numberPad)
                                        .frame(width: 50)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                                
                                // Weight
                                VStack(alignment: .leading) {
                                    Text("Weight")
                                    TextField("", value: $exerciseForm.weightVals[index], formatter: integerFormatter)
                                        .keyboardType(.numberPad)
                                        .frame(width: 60)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                                
                                // Rest
                                VStack(alignment: .leading) {
                                    Text("Rest")
                                    TextField("", value: $exerciseForm.restTimes[index], formatter: integerFormatter)
                                        .keyboardType(.numberPad)
                                        .frame(width: 60)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                            }
                        }
                        .padding(.vertical, 5)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
