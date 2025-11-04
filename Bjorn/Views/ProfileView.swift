//
//  ProfileView.swift
//  ToDoList
//
//  Created by gmac on 10/7/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    private let userId: String?
    
    init(userId: String? = nil) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
            }
            .navigationTitle(Text("Profile"))
        }
    }
}

#Preview {
    ProfileView()
}
