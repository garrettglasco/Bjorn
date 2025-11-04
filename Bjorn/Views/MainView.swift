//
//  ContentView.swift
//  Bjorn
//
//  Created by gmac on 10/20/25.
//
import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            accountView

        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            AnalysisView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Analysis", systemImage: "graph.2d")
                }
            
            ProfileView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
            ForgeView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Forge", systemImage: "figure.strengthtraining.traditional")
                }
        }
    }
}


#Preview {
    MainView()
}

