//
//  SplashView.swift
//  AppFitness
//
//  Created by Pedro on 6/12/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Image("Fondo1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 100)
                    
                ProgressView(NSLocalizedString("Cargando músculos", comment: ""))
                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
                    .foregroundColor(Color.red)
                    .font(.system(size: 15, weight: .bold))
                    .scaleEffect(2.0)
                    .padding(.bottom, -50)
                    .id(0)
            }
            .padding([.leading, .trailing], 20)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isActive = true
                }
            }
            .fullScreenCover(isPresented: $isActive, content: {
                ContentView()
            })
        }
        .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
