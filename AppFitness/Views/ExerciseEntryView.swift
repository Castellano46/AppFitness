//
//  ExerciseEntryView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseEntryView: View {
    @State private var exerciseName = ""

    // Utiliza @ObservedObject para inyectar el almacén de ejercicios
    @ObservedObject var exerciseStore: ExerciseStore

    var body: some View {
        NavigationView {
            VStack {
                // Contenido de ExerciseEntryView

                // Botón de retroceso personalizado
                Button(action: {
                    // Agrega aquí cualquier lógica adicional que necesites antes de navegar hacia atrás
                }) {
                    Image(systemName: "arrow.left")
                        .padding()
                        .foregroundColor(.blue)
                }
                .frame(alignment: .topLeading)

                NavigationLink(destination: ExerciseRegistrationView(exerciseList: $exerciseStore.exercises)) {
                    Text("Registrar Ejercicio")
                }

                // Lista de ejercicios registrados
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
            .navigationBarHidden(true) // Oculta la barra de navegación
        }
    }
}

struct ExerciseEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseEntryView(exerciseStore: ExerciseStore()) // Pasa una instancia de ExerciseStore aquí
    }
}
