//
//  LoginView-ViewModel.swift
//  Agenda
//
//  Created by Diego Moreno on 26/1/23.
//

import Foundation

extension LoginView {
    class ViewModel : ObservableObject {
        
        
        // MARK: - Properties
        @Published var isLoged: Bool = false
        @Published var showAlert: Bool = false
        @Published var title: String = ""
        @Published var message: String = ""
        
        
        // MARK: - Functions
        
        func login(user: String, pass: String) {
            let url = "https://superapi.netlify.app/api/login"
            let dictionary: [String: Any] = [
                "user" : user,
                "pass" : pass
            ]
            
            NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    print(data.debugDescription)
                    if response.statusCode == 200 {
                        print(response.statusCode)
                        self.onSuccess()
                    } else {
                        print(response.statusCode)
                        self.onError(error: error?.localizedDescription ?? "")
                    }
                }
            }
        }

        func onSuccess() {
            isLoged = true
        }

        func onError(error: String) {
            print(error)
            title = "El usuario no existe"
            message = "Asegúrate de haberlo escrito todo correctamente"
            showAlert = true
        }
    }
}
