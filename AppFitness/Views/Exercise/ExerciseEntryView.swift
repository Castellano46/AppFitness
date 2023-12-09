//
//  ExerciseEntryView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseEntryView: View {
    //@EnvironmentObject var exerciseStore: ExerciseStore
    @StateObject private var exerciseStore = ExerciseStore()
    
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

                NavigationLink(destination: ExerciseRegistrationView(exerciseStore: exerciseStore)) {
                    Text("Registrar Ejercicio")
                }

                List($exerciseStore.exercises) { exerciseBinding in
                    VStack(alignment: .leading) {
                        Text(exerciseBinding.wrappedValue.name)
                            .font(.headline)
                        Text("Duración: \(exerciseBinding.wrappedValue.duration) minutos")
                        Text("Peso: \(exerciseBinding.wrappedValue.weight) kg")
                    }
                }
                .navigationBarTitle("Ejercicios Registrados")
            }
            .navigationBarHidden(true)
        }
        .environmentObject(exerciseStore) 
    }
}

struct ExerciseEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseEntryView()
            .environmentObject(ExerciseStore())
    }
}
