//
//  LoginExtension.swift
//  Agenda
//
//  Created by Diego Moreno on 13/1/23.
//

import SwiftUI

extension RegisterView {
    
    var backgroundColor : some View {
        Color.mint
            .ignoresSafeArea()
    }
    var titleView : some View {
        Text("Registro")
            .foregroundColor(.indigo)
            .font(.system(size: 50, weight: .bold))
            .padding(.top, 50)
    }
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
            if password == repeatPassword {
                register(user: email, pass: password)
            } else {
                print("A")
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
