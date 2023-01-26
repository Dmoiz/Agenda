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
    //@State var username : String = ""
    @State var password : String = ""
    @State var repeatPassword : String = ""
    @Environment(\.dismiss) private var dismiss
    // MARK: - Body
    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                titleView
                Spacer()
                ImageView()
                textFields()
                Spacer()
                btnRegister()
                //                    AlertsDialog
                
            }
        }
    }
    
    func register(user: String, pass: String) {
        let url = "https://superapi.netlify.app/api/register"
        let dictionary = [
            "user" : email,
            "pass" : password
        ]
        
        NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
            if let error = error {
                onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                print(data.debugDescription)
                if response.statusCode == 200 {
                    onSuccess()
                } else {
                    onError(error: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func onSuccess() {
        dismiss()
    }
    
    func onError(error: String) {
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


struct ImageView : View {
    var body: some View {
        Image("bruh")
            .resizable()
            .frame(width: 150, height: 150)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding(.top, 80)
            .padding(.bottom, 20)
    }
}

//                Button {
//                    shouldShowRegister = true
//                } label: {
//                    Text("Go to Login")
//                        .foregroundColor(.brown)
//                        .font(.system(size: 20))
//                }.background(
//                    NavigationLink(destination: LoginView(), isActive: $shouldShowRegister, label: {
//                        EmptyView()
//                    })
//                )
