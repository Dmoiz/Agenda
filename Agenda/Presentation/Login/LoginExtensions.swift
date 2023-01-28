//
//  LoginExtensions.swift
//  Agenda
//
//  Created by Diego Moreno on 16/1/23.
//

import SwiftUI

extension LoginView {
    
    func textFields() -> some View {
        VStack {
            TextField("Username", text: $email)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .background(.white)
                .cornerRadius(20)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .background(.white)
                .cornerRadius(20)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                .padding(.horizontal)
        }
    }
    
    func btnLogin() -> some View {
        Button {
            if email.isEmpty || password.isEmpty {
                viewModel.title = "Hay campos vacíos"
                viewModel.message = "Comprueba que has rellenado todos los campos correctamente"
                viewModel.showAlert = true
            } else {
                viewModel.login(user: email, pass: password)
            }
        } label: {
            Text("Login")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.pink)
        }
        .cornerRadius(40)
        .padding(.horizontal, 50)
        .padding(.bottom, 30)
        .background(
            NavigationLink(destination: HomeView(), isActive: $viewModel.isLoged) {
                EmptyView()
            }
        )
    }
}
