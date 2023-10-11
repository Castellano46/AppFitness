//
//  ExerciseDetailView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    var exercise: Exercise
    @Binding var exerciseList: [Exercise]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Nombre: \(exercise.name)")
            Text("Duración: \(exercise.duration) minutos")
            Text("Peso: \(exercise.weight) kg")

            Button(action: {
                // Agregar lógica para eliminar el ejercicio
                if let index = exerciseList.firstIndex(where: { $0.id == exercise.id }) {
                    exerciseList.remove(at: index)
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Eliminar Ejercicio")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .navigationBarTitle("Detalle del Ejercicio", displayMode: .inline)
    }
}