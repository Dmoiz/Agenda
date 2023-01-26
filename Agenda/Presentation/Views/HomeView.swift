//
//  HomeView.swift
//  Agenda
//
//  Created by Diego Moreno on 17/1/23.
//

import SwiftUI

struct EventResponseModel: Decodable {
    let name: String?
    let date: Int?
    
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

struct HomeView: View {
    @State private var date: Date = Date()
    @State private var events: [EventPresentationModel] = []
    @State private var shouldShowNewEvent: Bool = false
    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                titleViews(title: "Agéndame esta")
                ScrollView {
                    LazyVStack() {
                        ForEach(events) { event in
                            HStack {
                                Text(event.name)
                                    .lineLimit(1)
                                Spacer()
                                Text(unixToDate(date: event.date))
                            }
                            .font(.system(size: 20, weight: .medium))
                            .padding(10)
                            Divider()
                                .background(Color.black)
                                .font(.system(size: 40))
                        }
                    }
                    .padding(10)
                }
                .background(Color.white)
                .cornerRadius(40)
                .padding(.bottom, 10)
                .ignoresSafeArea()
                .padding(.horizontal, 10)
                
            }
            .navigationBarBackButtonHidden()
        }
        .sheet(isPresented: $shouldShowNewEvent, content: {
            CreateEventView(shouldShowNewEvent: $shouldShowNewEvent) {
                getEvents()
            }
        })
        .toolbar {
            Button {
                shouldShowNewEvent = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 17))
            }
        }
        .onAppear{
            getEvents()
        }
    }
    
    func getEvents() {
        let url = "https://superapi.netlify.app/api/db/eventos"

        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            if let error = error {
                onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print(response.statusCode)
                    onSuccess(data: data)
                } else {
                    print(response.statusCode)
                    onError(error: error?.localizedDescription ?? "")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
