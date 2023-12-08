//
//  ConfirmationView.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import SwiftUI

struct ConfirmationView: View {
    @Binding var isShowingConfirmation: Bool

    var body: some View {
        VStack {
            Text("Sus datos se han guardado correctamente")
                .font(.title)
                .padding()
            
            Button(action: {
                isShowingConfirmation = false
            }) {
                Text("OK")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(isShowingConfirmation: .constant(true))
    }
}
