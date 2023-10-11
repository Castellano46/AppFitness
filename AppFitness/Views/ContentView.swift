//
//  ContentView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var exerciseStore = ExerciseStore() // Crear una instancia de ExerciseStore
    
    var body: some View {
        NavigationView {
            VStack {
                Text("MyFitnessApp")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: ExerciseEntryView(exerciseStore: exerciseStore)) {
                    Text("Registrar Ejercicio")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: StatisticsView()) {
                    Text("Ver Estadísticas")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: PersonalInfoView()) {
                    Text("Ingresar Datos Personales")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Inicio")
        }
        .environmentObject(exerciseStore) // Inyectar el almacén de ejercicios
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
