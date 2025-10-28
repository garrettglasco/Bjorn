//
//  NewExerciseView.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import SwiftUI
import FirebaseFirestore

struct NewExerciseView: View {
    @StateObject var viewModel = NewExerciseViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Exercise Info")) {
                    TextField("Exercise name", text: $viewModel.name)
                    //TextField("Category (e.g. Chest, Legs)", text: $viewModel.category)
                }
                
//                Section(header: Text("Notes")) {
//                    TextField("Notes (optional)", text: $viewModel.notes, axis: .vertical)
//                        .lineLimit(3, reservesSpace: true)
//                }
                
                TLButton(title: "Create Exercise",
                         backgroundColor: .vibrantGreen) {
                    viewModel.saveExercise()
                }
            }
        }
    }
}

#Preview {
    NewExerciseView()
}

