//
//  ContentView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    //@EnvironmentObject var exerciseStore: ExerciseStore
    @StateObject var exerciseStore = ExerciseStore()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("MyFitnessApp")
                    .font(.largeTitle)
                    .padding(.bottom, 20)

                NavigationLink(destination: ExerciseEntryView()) {
                    Text("Registrar Ejercicio")
                        .buttonStyle(MyButtonStyle(color: .blue))
                }

                NavigationLink(destination: StatisticsView()) {
                    Text("Ver Estadísticas")
                        .buttonStyle(MyButtonStyle(color: .green))
                }

                NavigationLink(destination: PersonalInfoView()) {
                    Text("Ingresar Datos Personales")
                        .buttonStyle(MyButtonStyle(color: .orange))
                }
            }
            .navigationBarTitle("Inicio")
        }
        .environmentObject(exerciseStore)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyButtonStyle: ButtonStyle {
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(color)
            .cornerRadius(10)
            .padding()
    }
}
