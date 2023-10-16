//
//  ExerciseEntryView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseEntryView: View {
    @State private var exerciseName = ""
    @ObservedObject var exerciseStore: ExerciseStore

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                }) {
                    Image(systemName: "arrow.left")
                        .padding()
                        .foregroundColor(.blue)
                }
                .frame(alignment: .topLeading)

                NavigationLink(destination: ExerciseRegistrationView(exerciseList: $exerciseStore.exercises)) {
                    Text("Registrar Ejercicio")
                }

                List(exerciseStore.exercises) { exercise in
                    VStack(alignment: .leading) {
                        Text(exercise.name)
                            .font(.headline)
                        Text("Duración: \(exercise.duration) minutos")
                        Text("Peso: \(exercise.weight) kg")
                    }
                }
                .navigationBarTitle("Ejercicios Registrados")
            }
            .navigationBarHidden(true)
        }
    }
}

struct ExerciseEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseEntryView(exerciseStore: ExerciseStore()) 
    }
}
