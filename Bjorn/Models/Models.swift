// Models.swift
import Foundation
import FirebaseFirestore

// MARK: - User (Profile)
struct UserProfile: Identifiable, Codable {
    @DocumentID var id: String?          // user doc id (uid)
    var firstName: String
    var lastName: String
    var email: String?
    
    var displayName: String {
        "\(firstName) \(lastName)"
    }
}

// MARK: - Exercise (master exercise list)
struct Exercise: Identifiable, Codable {
    var id: String
    var userId: String     // owner (optional)
    var name: String
    var notes: String?
    var category: String?    // e.g. "Legs", "Chest"
}

// MARK: - Workout (template)
struct Workout: Identifiable, Codable {
    var id: String
    var userId: String
    var name: String
    var split: String?
    var createdAt: Date?     // Firestore will store as Timestamp
}

// MARK: - WorkoutDetails (items in a workout template)
struct WorkoutDetail: Identifiable, Codable {
    var id: String
    var workoutId: String
    var exerciseId: String
    var weight: Double
    var SetNum: Int
    var repNum: Int?
    var restVal: Int?    // rest in seconds
}

// MARK: - WorkoutLog (one completed workout instance)
struct WorkoutLog: Identifiable, Codable {
    var id: String
    var workoutId: String
    var userId: String
    var date: Date?
    var notes: String?
}

// MARK: - WorkLogDetails (actual sets performed)
struct WorkLogDetail: Identifiable, Codable {
    var id: String
    var workoutLogId: String
    var exerciseId: String
    var weight: Double?
    var repsCaptured: Int?
    var restCapturedSeconds: Int?
    var timeFinished: Date?
    var skipped: Bool?
    var setOrder: Int?    // which set number for that exercise
}


// MARK: - Helpers
extension Encodable {
    /// Converts any Encodable into a [String: Any] dictionary suitable for Firestore.
    /// Dates will be encoded as Firestore Timestamps via JSONEncoder default; adjust if needed.
    func asDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            return jsonObject as? [String: Any] ?? [:]
        } catch {
            return [:]
        }
    }
}
