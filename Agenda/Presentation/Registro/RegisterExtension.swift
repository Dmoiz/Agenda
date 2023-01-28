//
//  LoginExtension.swift
//  Agenda
//
//  Created by Diego Moreno on 13/1/23.
//

import SwiftUI

extension RegisterView {
    
    func textFields() -> some View {
        VStack {
            TextField("Username", text: $email)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .background(.indigo)
                .cornerRadius(20)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .background(.indigo)
                .cornerRadius(20)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                .padding(.horizontal)
            
            SecureField("Repeat Password", text: $repeatPassword)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .background(.indigo)
                .cornerRadius(20)
                .autocorrectionDisabled(false)
                .autocapitalization(.none)
                .padding(.horizontal)
                .padding(.bottom, 100)
        }
    }
    
    func btnRegister() -> some View {
        Button {
            if email.isEmpty || password.isEmpty || repeatPassword.isEmpty{
                viewModel.title = "Hay campos vacíos"
                viewModel.message = "Comprueba que has rellenado todos los campos correctamente"
                viewModel.showAlert = true
                print("Vacío")
            } else if password != repeatPassword {
                viewModel.title = "Las contraseñas no coinciden"
                viewModel.message = "Comprueba que hayas puesto las contraseñas correctamente"
                viewModel.showAlert = true
                print("incorrectas")
            } else {
                viewModel.register(user: email, pass: password)
            }
        } label: {
            Text("Registrarse")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
        }
        .cornerRadius(40)
        .padding(.horizontal, 50)
        .padding(.bottom, 30)
    }
}
