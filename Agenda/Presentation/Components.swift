//
//  Components.swift
//  Agenda
//
//  Created by Diego Moreno on 20/1/23.
//

import SwiftUI

struct backgroundColor : View {
    var body: some View {
        Color.mint
            .ignoresSafeArea()
    }
}

struct titleViews : View {
    var title: String
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .font(.system(size: 50, weight: .bold))
    }
}

//struct showAlerts : View {
//    var title: Text
//    var message: Text
//    var showAlert: Bool
//    var body: some View {
//        Text("")
//            .alert("", isPresented: showAlert) {
//                Alert(title: title, message: message)
//            }
//    }
//}

//struct textFields : View {
//    var body: some View {
//        
//    }
//}


//func btnLogin() -> some View {
//    
//    Button {
//        login(user: email, pass: password)
//    } label: {
//        Text("Login")
//            .foregroundColor(.black)
//            .font(.system(size: 30, weight: .heavy))
//            .frame(height: 60)
//            .frame(maxWidth: .infinity)
//            .background(Color.pink)
//    }
//    .cornerRadius(40)
//    .padding(.horizontal, 50)
//    .padding(.bottom, 30)
//    .background(
//        NavigationLink(destination: HomeView(), isActive: $isLoged) {
//            EmptyView()
//        }
//    )
//}
