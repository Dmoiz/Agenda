//
//  ContentView.swift
//  Agenda
//
//  Created by Diego Moreno on 9/1/23.

import SwiftUI

struct LoginView: View {
    
    
    // MARK: - Properties
    
    @State var email : String = ""
    @State var password : String = ""
    @State var showAlert : Bool = false
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationView() {
            ZStack {
                backgroundColor()
                VStack {
                    titleViews(title: "Login")
                    Spacer()
                    textFields()
                    Spacer()
                    btnLogin()
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Go to Register")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                    }
                }
            }
        }
        .alertCustom(title: viewModel.title, message: viewModel.message, show: $viewModel.showAlert)
        .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
