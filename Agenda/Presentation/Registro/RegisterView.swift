//
//  RegisterView.swift
//  Agenda
//
//  Created by Diego Moreno on 10/1/23.
//

import SwiftUI

struct RegisterView: View {
    
    
    // MARK: - Properties
    
    @State var email : String = ""
    @State var password : String = ""
    @State var repeatPassword : String = ""
    
    @ObservedObject var viewModel : ViewModel = ViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                titleViews(title: "Registro")
                Spacer()
                textFields()
                Spacer()
                btnRegister()
            }
        }
        
        .alertCustom(title: viewModel.title, message: viewModel.message, show: $viewModel.showAlert)
        .onReceive(viewModel.$isRegistered) { newValue in
            dismiss.callAsFunction()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
