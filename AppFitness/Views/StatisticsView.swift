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
    @State private var bmi: Double = 0.0
    @State private var bmiCategory = ""

    var body: some View {
        VStack {
            Text("Estadísticas")
                .font(.largeTitle)
                .padding(.bottom, 20)

            // Mostrar el nombre y los datos personales ingresados
            Text("Nombre: \(name)")
            Text("Altura: \(height) cm")
            Text("Peso: \(weight) kg")
            Text("Sexo: \(gender)")
            Text("Edad: \(age) años")

            // Calcular el IMC y categoría
            Text("IMC: \(String(format: "%.1f", bmi))")
            Text("Categoría: \(bmiCategory)")

        }
        .onAppear {
            // Cargar los datos desde UserDefaults
            name = UserDefaults.standard.string(forKey: "user_name") ?? ""
            height = UserDefaults.standard.string(forKey: "user_height") ?? ""
            weight = UserDefaults.standard.string(forKey: "user_weight") ?? ""
            gender = UserDefaults.standard.string(forKey: "user_gender") ?? ""
            age = UserDefaults.standard.string(forKey: "user_age") ?? ""

            // Calcular el IMC
            if let heightDouble = Double(height), let weightDouble = Double(weight) {
                let heightInMeters = heightDouble / 100.0
                bmi = weightDouble / (heightInMeters * heightInMeters)
                bmiCategory = calculateBMICategory(bmi)
            }
        }
        .navigationBarTitle("", displayMode: .inline) // Oculta el título y muestra el botón de retroceso estándar
    }

    // Función para calcular la categoría del IMC
    private func calculateBMICategory(_ bmi: Double) -> String {
        if bmi < 18.5 {
            return "Bajo peso"
        } else if bmi < 24.9 {
            return "Peso normal"
        } else if bmi < 29.9 {
            return "Sobrepeso"
        } else if bmi < 34.9 {
            return "Obesidad (Grado I)"
        } else if bmi < 39.9 {
            return "Obesidad (Grado II)"
        } else {
            return "Obesidad (Grado III o Mórbida)"
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
