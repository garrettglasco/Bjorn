import SwiftUI

struct NewWorkoutSetView: View {
    @Binding var weightVal: Double
    @Binding var repNum: Int
    @Binding var restTime: Int

    // Optional control visibility per field
    var showWeightControls: Bool = true
    var showRepControls: Bool = true
    var showRestControls: Bool = true

    var body: some View {
        Form {
            NumericFieldRowDouble(
                title: "Starter Weight",
                value: $weightVal,
                showControls: showWeightControls
            )

            NumericFieldRow(
                title: "Starter Reps",
                value: $repNum,
                showControls: showRepControls
            )

            NumericFieldRow(
                title: "Rest Time (sec)",
                value: $restTime,
                showControls: showRestControls
            )
        }
    }
}

struct NumericFieldRow: View {
    let title: String
    @Binding var value: Int
    var showControls: Bool = true

    @State private var interval: Int = 1
    @FocusState private var isFocused: Bool

    private let integerFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)

            HStack {
                if showControls {
                    Button(action: { value = max(0, value - interval) }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }

                TextField("", value: $value, formatter: integerFormatter)
                    .keyboardType(.numberPad)
                    .focused($isFocused)
                    .frame(width: 60)
                    .padding(6)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)

                if showControls {
                    Button(action: { value += interval }) {
                        Image(systemName: "chevron.up.circle.fill")
                            .font(.title3)
                            .foregroundColor(.green)
                    }
                }

                Spacer()

                if showControls {
                    HStack(spacing: 4) {
                        Text("Interval:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        TextField("", value: $interval, formatter: integerFormatter)
                            .keyboardType(.numberPad)
                            .frame(width: 50)
                            .padding(6)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding(6)
            .background(Color(.systemGray5).opacity(0.3))
            .cornerRadius(10)
        }
        .padding(.vertical, 4)
    }
}

struct NumericFieldRowDouble: View {
    let title: String
    @Binding var value: Double
    var showControls: Bool = true

    @State private var interval: Double = 1
    @FocusState private var isFocused: Bool

    private let doubleFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)

            HStack {
                if showControls {
                    Button(action: { value = max(0, value - interval) }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }

                TextField("", value: $value, formatter: doubleFormatter)
                    .keyboardType(.decimalPad)
                    .focused($isFocused)
                    .frame(width: 80)
                    .padding(6)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)

                if showControls {
                    Button(action: { value += interval }) {
                        Image(systemName: "chevron.up.circle.fill")
                            .font(.title3)
                            .foregroundColor(.green)
                    }
                }

                Spacer()

                if showControls {
                    HStack(spacing: 4) {
                        Text("Interval:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        TextField("", value: $interval, formatter: doubleFormatter)
                            .keyboardType(.decimalPad)
                            .frame(width: 70)
                            .padding(6)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding(6)
            .background(Color(.systemGray5).opacity(0.3))
            .cornerRadius(10)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    @Previewable @State var weight: Double = 135
    @Previewable @State var reps: Int = 10
    @Previewable @State var rest: Int = 60

    VStack {
        // Only weight field has controls
        NewWorkoutSetView(
            weightVal: $weight,
            repNum: $reps,
            restTime: $rest,
            showWeightControls: true,
            showRepControls: false,
            showRestControls: false
        )
    }
}
