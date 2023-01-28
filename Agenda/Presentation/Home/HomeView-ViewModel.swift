//
//  HomeView-ViewModel.swift
//  Agenda
//
//  Created by Diego Moreno on 28/1/23.
//

import Foundation

//extension HomeView {
//    class ViewModel : ObservableObject {
//        
//        
//        func getEvents() {
//            let url = "https://superapi.netlify.app/api/db/eventos"
//
//            NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
//                if let error = error {
//                    self.onError(error: error.localizedDescription)
//                } else if let data = data, let response = response as? HTTPURLResponse {
//                    if response.statusCode == 200 {
//                        print(response.statusCode)
//                        self.onSuccess(data: data)
//                    } else {
//                        print(response.statusCode)
//                        self.onError(error: error?.localizedDescription ?? "")
//                    }
//                }
//            }
//        }
//        
//        func onSuccess(data: Data) {
//            do {
//                let eventsNotFiltered = try JSONDecoder().decode([EventResponseModel?].self, from: data)
//                self.events = eventsNotFiltered.compactMap({ eventNotFiltered in
//                    guard let date = eventNotFiltered?.date else { return nil }
//                    
//                    return EventPresentationModel(name: eventNotFiltered?.name ?? "Empty Name", date: date)
//                })
//            } catch {
//                onError(error: error.localizedDescription)
//            }
//        }
//        
//        func onError(error: String) {
//            print(error)
//        }
//    }
//}
