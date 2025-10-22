//
//  NewWorkoutLog.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import SwiftUI

struct NewWorkoutLogView: View {
    @StateObject var viewModel = NewWorkoutLogViewModel()
    @Binding var NewLogPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 100)
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //Date Picker
                DatePicker("Due Date", selection: $viewModel.duedate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save",
                         backgroundColor: .pink) {
                    viewModel.save()
                    NewLogPresented.toggle()
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewWorkoutLogView(NewLogPresented: .constant(false))
}
