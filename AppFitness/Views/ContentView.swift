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
            ZStack {
                Image("Fondo2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack {
                    Text("My Fitness App")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 100)
                    
                    NavigationLink(destination: ExerciseEntryView()) {
                        Text("Registrar Ejercicio")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .opacity(0.8)
                            .cornerRadius(20)
                            .padding()
                    }
                    
                    NavigationLink(destination: StatisticsView()) {
                        Text("Ver Estadísticas")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                            .padding()
                    }
                    
                    NavigationLink(destination: PersonalInfoView()) {
                        Text("Datos Personales")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color.orange)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                            .padding()
                    }
                }
                .navigationBarHidden(true)
                .environmentObject(exerciseStore)
            }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

