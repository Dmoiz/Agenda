//
//  HomeView-ViewModel.swift
//  Agenda
//
//  Created by Diego Moreno on 28/1/23.
//

import Foundation

extension HomeView {
    
    struct EventResponseModel: Decodable {
        var name: String?
        var date: Int?
        
        enum CodingKeys: String, CodingKey {
            case name
            case date
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            
            if let date = try? values.decodeIfPresent(Int.self, forKey: .date) {
                self.date = Int(date)
            } else if let date = try? values.decodeIfPresent(String.self, forKey: .date) {
                self.date = Int(date)
            } else if let _ = try? values.decodeIfPresent(Float.self, forKey: .date){
                self.date = nil
            } else {
                self.date = try values.decodeIfPresent(Int.self, forKey: .date)
            }
            
            self.name = try values.decodeIfPresent(String.self, forKey: .name)
        }
    }

    struct EventPresentationModel: Identifiable {
        let id = UUID()
        let name: String
        let date: Int
    }
    
    class ViewModel : ObservableObject {
        
        @Published var events: [EventPresentationModel] = []
        
        func getEvents() {
            let url = "https://superapi.netlify.app/api/db/eventos"

            NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        print(response.statusCode)
                        self.onSuccess(data: data)
                    } else {
                        print(response.statusCode)
                        self.onError(error: error?.localizedDescription ?? "")
                    }
                }
            }
        }
        
        func onSuccess(data: Data) {
            do {
                let eventsNotFiltered = try JSONDecoder().decode([EventResponseModel?].self, from: data)
                self.events = eventsNotFiltered.compactMap({ eventNotFiltered in
                    guard let date = eventNotFiltered?.date else { return nil }
                    
                    return EventPresentationModel(name: eventNotFiltered?.name ?? "Empty Name", date: date)
                })
            } catch {
                onError(error: error.localizedDescription)
            }
        }
        
        func onError(error: String) {
            print(error)
        }
        
        func unixToDate(date: Int) -> String {
            let date = NSDate(timeIntervalSince1970: TimeInterval(date))
            let dayTimePeriodFormatter = DateFormatter()
            dayTimePeriodFormatter.dateFormat = "dd, MMMM yyyy"
            let dateString = dayTimePeriodFormatter.string(from: date as Date)
            return dateString
        }
    }
}
