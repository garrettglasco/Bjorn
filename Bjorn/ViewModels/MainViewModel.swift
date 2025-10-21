//
//  MainViewModel.swift
//  ToDoList
//
//  Created by gmac on 10/7/25.
//

import Foundation
import Combine
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private lazy var handler: AuthStateDidChangeListenerHandle? = nil
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async() {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

