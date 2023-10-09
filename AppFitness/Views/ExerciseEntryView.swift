//
//  ExerciseEntryView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseEntryView: View {
    @State private var exerciseName = ""
    @State private var exercises: [Exercise] = []

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
                
                NavigationLink(destination: ExerciseRegistrationView(exerciseList: $exercises)) {
                    Text("Registrar Ejercicio")
                }
                
                List(exercises) { exercise in
                    VStack(alignment: .leading) {
                        Text("Nombre: \(exercise.name)")
                        Text("Duración: \(exercise.duration) minutos")
                        Text("Peso: \(exercise.weight) kg")
                    }
                }
            }
            .navigationBarHidden(true) 
        }
    }
}

struct ExerciseEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseEntryView()
    }
}
