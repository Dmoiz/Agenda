//
//  LoginExtensions.swift
//  Agenda
//
//  Created by Diego Moreno on 16/1/23.
//

import SwiftUI

extension LoginView {
    
//    var backgroundColor : some View {
//        Color.orange
//            .ignoresSafeArea()
//    }
    var title : some View {
        Text("Login")
            .foregroundColor(.pink)
            .font(.system(size: 50, weight: .bold))
            .padding(.top, 50)
    }
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
            login(user: email, pass: password)
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
            NavigationLink(destination: HomeView(), isActive: $isLoged) {
                EmptyView()
            }
        )
    }
}
