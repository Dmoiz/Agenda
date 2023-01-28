//
//  RegisterView-ViewModel.swift
//  Agenda
//
//  Created by Diego Moreno on 27/1/23.
//

import Foundation

extension RegisterView {
    class ViewModel : ObservableObject{
        
        
        // MARK: - Properties
        
        @Published var isRegistered: Bool = false
        @Published var showAlert: Bool = false
        @Published var title: String = ""
        @Published var message: String = ""
        
        
        // MARK: - Functions
        
        func register(user: String, pass: String) {
            let url = "https://superapi.netlify.app/api/register"
            let dictionary = [
                "user" : user,
                "pass" : pass
            ]
            
            NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    print(data.debugDescription)
                    if response.statusCode == 200 {
                        self.onSuccess()
                    } else {
                        self.onError(error: error?.localizedDescription ?? "")
                    }
                }
            }
        }

        func onSuccess() {
            isRegistered = true
        }

        func onError(error: String) {
            print(error)
            title = "Ha ocurrido un error al registrar al usuario"
            message = "Comprueba que has escrito todo correctamente"
            showAlert = true
        }
    }
}

