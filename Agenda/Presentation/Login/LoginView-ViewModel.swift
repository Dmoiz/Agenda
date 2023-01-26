//
//  LoginView-ViewModel.swift
//  Agenda
//
//  Created by Diego Moreno on 26/1/23.
//

//import SwiftUI
//
//extension LoginView {
//    class ViewModel : ObservableObject {
//        @Published var isLoged: Bool = false
//        func login(user: String, pass: String) {
//            let url = "https://superapi.netlify.app/api/login"
//            let dictionary = [
//                "user" : email,
//                "pass" : password
//            ]
//            NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
//                if let error = error {
//                    onError(error: error.localizedDescription)
//                } else if let data = data, let response = response as? HTTPURLResponse {
//                    print(data.debugDescription)
//                    if response.statusCode == 200 {
//                        print(response.statusCode)
//                        onSuccess()
//                    } else {
//                        print(response.statusCode)
//                        onError(error: error?.localizedDescription ?? "")
//                    }
//                }
//            }
//        }
//        
//        func onSuccess() {
//            $viewModel.isLoged = true
//        }
//        
//        func onError(error: String) {
//            showAlert = true
//        }
//    }
//}
