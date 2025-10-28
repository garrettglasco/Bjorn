import SwiftUI

struct ExerciseItemView: View {
    var exercise: Exercise
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(exercise.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(exercise.category ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    ExerciseItemView(
        exercise: Exercise(
            id: "123",
            userId: "456",
            name: "Exercise",
            category: "Exercise Category"
        )
    )
}
