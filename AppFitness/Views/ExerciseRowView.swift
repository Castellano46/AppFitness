//
//  ExerciseRowView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseRowView: View {
    var exercise: Exercise

    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.name)
                .font(.headline)
            Text("Duración: \(exercise.duration) minutos")
            Text("Peso: \(exercise.weight) kg")
        }
    }
}
