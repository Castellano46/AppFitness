//
//  ExerciseStore.swift
//  AppFitness
//
//  Created by Pedro on 1/12/23.
//

import CoreData

class ExerciseStore: ObservableObject {
    @Published var exercises: [Exercise] = []

    init() {
        fetchExercises()
    }

    func fetchExercises() {
        do {
            let request: NSFetchRequest<Exercise> = NSFetchRequest(entityName: "Exercise")
            exercises = try PersistenceController.shared.container.viewContext.fetch(request)
        } catch {
            print("Error fetching exercises: \(error)")
        }
    }

    func addExercise(name: String, duration: Float, weight: Float) {
        let newExercise = Exercise(context: PersistenceController.shared.container.viewContext)
        newExercise.name = name
        newExercise.duration = duration
        newExercise.weight = weight

        PersistenceController.shared.saveContext()
        fetchExercises()
    }

    func deleteExercise(at offsets: IndexSet) {
        for index in offsets {
            let exercise = exercises[index]
            PersistenceController.shared.container.viewContext.delete(exercise)
        }

        PersistenceController.shared.saveContext()
        fetchExercises()
    }
}
