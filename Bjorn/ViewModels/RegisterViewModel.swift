//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by gmac on 10/7/25.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    
    init() {}
    
    func Register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let userId = authResult?.user.uid else {
                return
            }
            
            self.insertUserRecord(id: userId)
            
            print("Success")
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joinedAt: Date().timeIntervalSince1970)
        
        let database = Firestore.firestore()
        try? database.collection("users")
            .document(id)
            .setData(encodeToDictionary(newUser))
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
    /// Encodes any Encodable value to a [String: Any] dictionary.
    /// Falls back to an empty dictionary if encoding/serialization fails.
    private func encodeToDictionary<T: Encodable>(_ value: T) -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(value)
            let object = try JSONSerialization.jsonObject(with: data, options: [])
            return object as? [String: Any] ?? [:]
        } catch {
            print("[RegisterViewModel] Failed to encode to dictionary: \(error)")
            return [:]
        }
    }
}
