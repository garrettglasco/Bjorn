//
//  AnalysisView.swift
//  Bjorn
//
//  Created by gmac on 10/21/25.
//

import SwiftUI

struct AnalysisView: View {
    @StateObject var viewModel = AnalysisViewModel()
    
    private let userId: String?
    
    init(userId: String? = nil) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("graph")
            }
            .navigationTitle(Text("Analysis"))
            .toolbar {
                Button {
                    viewModel.showingNewWorkoutView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
//            .sheet(isPresented: $viewModel.showingNewWorkoutView) {
//                NewWorkoutLogView(NewLogPresented: $viewModel.showingNewWorkoutView)
        }
    }
}

#Preview {
    AnalysisView()
}
