//
//  StatisticsView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct StatisticsView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var height = ""
    @State private var weight = ""
    @State private var gender = ""
    @State private var age = ""
    @State private var bmi: Double = 0.0
    @State private var bmiCategory = ""

    var body: some View {
        ZStack {
            Image("Fondo3")
                .resizable()
                .scaledToFill()
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Estadísticas")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 50)

                Text("Nombre: \(name)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Text("Altura: \(height) cm")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Text("Peso: \(weight) kg")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Text("Sexo: \(gender)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Text("Edad: \(age)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)

                // Calcular el IMC y categoría
                Text("IMC: \(String(format: "%.1f", bmi))")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)

                Text("Categoría: ")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                +
                Text(bmiCategory)
                    .bold()
                    .font(.title)
                    .foregroundColor(categoryColor(for: bmiCategory))
            }
            .foregroundColor(.white)
        }
        .onAppear {
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
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left.circle.fill")
                    .foregroundColor(.red)
                    .font(.title)
            }
        )
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

    // Función para obtener el color según la categoría
    private func categoryColor(for category: String) -> Color {
        switch category {
        case "Bajo peso", "Obesidad (Grado I)", "Obesidad (Grado II)", "Obesidad (Grado III o Mórbida)":
            return .red
        case "Sobrepeso":
            return .yellow
        case "Peso normal":
            return .green
        default:
            return .white
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
