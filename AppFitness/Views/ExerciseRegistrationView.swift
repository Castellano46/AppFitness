//
//  ExerciseRegistrationView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ExerciseRegistrationView: View {
    @State private var exerciseName = ""
    @State private var exerciseDuration = ""
    @State private var exerciseWeight = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var exerciseList: [Exercise]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Nombre del ejercicio", text: $exerciseName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Duración del ejercicio (minutos)", text: $exerciseDuration)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Peso del ejercicio (kg)", text: $exerciseWeight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if !exerciseName.isEmpty {
                        let newExercise = Exercise(name: exerciseName, duration: exerciseDuration, weight: exerciseWeight)
                        exerciseList.append(newExercise)
                        saveExercisesToUserDefaults(exerciseList)
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Guardar Ejercicio")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Registrar Ejercicio", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.blue)
            })
            .onAppear {
                exerciseList = loadExercisesFromUserDefaults()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func saveExercisesToUserDefaults(_ exercises: [Exercise]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(exercises) {
            UserDefaults.standard.set(encoded, forKey: "exercises")
        }
    }
    
    func loadExercisesFromUserDefaults() -> [Exercise] {
        if let exercisesData = UserDefaults.standard.data(forKey: "exercises") {
            let decoder = JSONDecoder()
            if let decodedExercises = try? decoder.decode([Exercise].self, from: exercisesData) {
                return decodedExercises
            }
        }
        return []
    }
}

struct ExerciseRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRegistrationView(exerciseList: .constant([]))
    }
}
