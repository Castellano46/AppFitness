//
//  Exercise.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct Exercise: Identifiable, Codable {
    let id = UUID()
    let name: String
    let duration: String
    let weight: String
}

class ExerciseStore: ObservableObject {
    @Published var exercises: [Exercise] = []

    init() {
        loadExercisesFromUserDefaults()
    }

    func addExercise(name: String, duration: String, weight: String) {
        let newExercise = Exercise(name: name, duration: duration, weight: weight)
        exercises.append(newExercise)

        saveExercisesToUserDefaults()
    }

    private func saveExercisesToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(exercises) {
            UserDefaults.standard.set(encoded, forKey: "exercises")
        }
    }

    private func loadExercisesFromUserDefaults() {
        if let exercisesData = UserDefaults.standard.data(forKey: "exercises") {
            let decoder = JSONDecoder()
            if let decodedExercises = try? decoder.decode([Exercise].self, from: exercisesData) {
                exercises = decodedExercises
            }
        }
    }
}
