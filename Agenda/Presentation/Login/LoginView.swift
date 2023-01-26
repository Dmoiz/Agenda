//
//  ContentView.swift
//  Agenda
//
//  Created by Diego Moreno on 9/1/23.
//  correo@correo.com
//  12345678

import SwiftUI

struct LoginView: View {
    @State var email : String = ""
    @State var password : String = ""
    @State var isLoged : Bool = false
    @State var showAlert : Bool = false
    //@ObservedObject var viewModel: ViewModel = ViewModel()
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
                        .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Algo ha fallado"),
                                    message: Text("Revisa que la cuente sea la correcta")
                                )
                            }
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
        .navigationBarBackButtonHidden()
    }
    
    func login(user: String, pass: String) {
        let url = "https://superapi.netlify.app/api/login"
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
                    print(response.statusCode)
                    onSuccess()
                } else {
                    print(response.statusCode)
                    onError(error: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func onSuccess() {
//        $viewModel.isLoged = true
    }
    
    func onError(error: String) {
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//extension LoginView {
//    class ViewModel : ObservableObject {
//        @Published var shouldShowAgenda: Bool = false
//    }
//}

