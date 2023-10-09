//
//  StatisticsView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct StatisticsView: View {
    @State private var name = ""
    @State private var height = ""
    @State private var weight = ""
    @State private var gender = ""
    @State private var age = ""

    var body: some View {
        VStack {
            Text("Estadísticas")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Text("Nombre: \(name)")
            Text("Altura: \(height) cm")
            Text("Peso: \(weight) kg")
            Text("Sexo: \(gender)")
            Text("Edad: \(age) años")
        }
        .onAppear {
            name = UserDefaults.standard.string(forKey: "user_name") ?? ""
            height = UserDefaults.standard.string(forKey: "user_height") ?? ""
            weight = UserDefaults.standard.string(forKey: "user_weight") ?? ""
            gender = UserDefaults.standard.string(forKey: "user_gender") ?? ""
            age = UserDefaults.standard.string(forKey: "user_age") ?? ""
        }
        .navigationBarTitle("", displayMode: .inline)
    }

    struct StatisticsView_Previews: PreviewProvider {
        static var previews: some View {
            StatisticsView()
        }
    }
}
