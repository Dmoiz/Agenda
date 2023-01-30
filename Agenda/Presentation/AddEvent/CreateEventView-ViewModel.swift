//
//  CreateEventView-ViewModel.swift
//  Agenda
//
//  Created by Diego Moreno on 29/1/23.
//

import Foundation

extension CreateEventView {
    
    class ViewModel : ObservableObject {
        
        @Published var shouldCloseView: Bool = false
        @Published var eventName: String = ""
        @Published var eventDate: Date = Date()
        @Published var timeString: String = ""
        @Published var title: String = ""
        @Published var message: String = ""
        @Published var showAlert: Bool = false
        
        func createEvents() {
            let url = "https://superapi.netlify.app/api/db/eventos"
            let timeInterval = eventDate.timeIntervalSince1970
            let intConversion = Int(timeInterval)
            let dictionary = [
                "name" : eventName,
                "date" : intConversion
            ] as [String : Any]
            
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
            shouldCloseView = true
        }
        
        func onError(error: String) {
            print(error)
        }
    }
}
