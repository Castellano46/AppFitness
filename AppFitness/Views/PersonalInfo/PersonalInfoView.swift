//
//  PersonalInfoView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct PersonalInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var height = ""
    @State private var weight = ""
    @State private var gender = 0
    @State private var age = ""
    @State private var showAlert = false
    @State private var navigateToHome = false
    
    private let nameKey = "user_name"
    private let heightKey = "user_height"
    private let weightKey = "user_weight"
    private let genderKey = "user_gender"
    private let ageKey = "user_age"
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Fondo4")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack {
                        TextField("Nombre", text: $name)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white.opacity(0.8)))
                            .padding(.horizontal, 20)
                        
                        TextField("Altura (cm)", text: $height)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white.opacity(0.8)))
                            .padding(.horizontal, 20)
                        
                        TextField("Peso (kg)", text: $weight)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white.opacity(0.8)))
                            .padding(.horizontal, 20)
                        
                        Picker("Sexo", selection: $gender) {
                            Text("Masculino").tag(0)
                            Text("Femenino").tag(1)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white.opacity(0.8)))
                        .padding(.horizontal, 20)
                        
                        TextField("Edad", text: $age)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white.opacity(0.8)))
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            UserDefaults.standard.set(name, forKey: nameKey)
                            UserDefaults.standard.set(height, forKey: heightKey)
                            UserDefaults.standard.set(weight, forKey: weightKey)
                            UserDefaults.standard.set(gender == 0 ? "Masculino" : "Femenino", forKey: genderKey)
                            UserDefaults.standard.set(age, forKey: ageKey)
                            
                            showAlert = true
                        }) {
                            Text("Guardar")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Éxito"), message: Text("Sus datos se han guardado correctamente"), primaryButton: .default(Text("OK")) {
                                navigateToHome = true
                            }, secondaryButton: .cancel())
                        }
                        .background(
                            NavigationLink("", destination: ContentView(), isActive: $navigateToHome)
                                .hidden()
                        )
                        Spacer()
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
