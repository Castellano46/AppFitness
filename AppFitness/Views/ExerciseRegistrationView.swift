//
//  ExerciseRegistrationView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseRegistrationView: View {
    @ObservedObject var exerciseStore: ExerciseStore

    @State private var exerciseName = ""
    @State private var exerciseDuration = ""
    @State private var exerciseWeight = ""
    
    @State private var didLoadExercises = false
    @State private var navigateToDetailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Nombre del ejercicio", text: $exerciseName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Duración del ejercicio (minutos)", text: $exerciseDuration)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()

                TextField("Peso del ejercicio (kg)", text: $exerciseWeight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()

                Button(action: {
                    if !exerciseName.isEmpty, let durationFloat = Float(exerciseDuration), let weightFloat = Float(exerciseWeight) {
                        exerciseStore.addExercise(name: exerciseName, duration: durationFloat, weight: weightFloat)
                        exerciseName = ""
                        exerciseDuration = ""
                        exerciseWeight = ""
                        navigateToDetailView = true
                    } else {
                        print("Error: No se pudieron convertir duration o weight a Float")
                    }
                }) {
                    Text("Guardar Ejercicio")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                List {
                    ForEach($exerciseStore.exercises) { $exercise in
                        NavigationLink(destination: ExerciseDetailView(exercise: exercise, exerciseList: $exerciseStore.exercises)) {
                            ExerciseRowView(exercise: exercise)
                        }
                    }
                    .onDelete(perform: deleteExercise)
                }
                .background(
                    NavigationLink("", destination: ExerciseDetailView(exercise: exerciseStore.exercises.last ?? Exercise(), exerciseList: $exerciseStore.exercises), isActive: $navigateToDetailView)
                        .hidden()
                )
                Spacer()
            }
            .navigationBarTitle("Registrar Ejercicio", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                if !didLoadExercises {
                    exerciseStore.fetchExercises()
                    didLoadExercises = true
                }
            }
        }
    }

    func deleteExercise(at offsets: IndexSet) {
        exerciseStore.deleteExercise(at: offsets)
        print("Ejercicio eliminado")
    }
}

struct ExerciseRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRegistrationView(exerciseStore: ExerciseStore())
    }
}
