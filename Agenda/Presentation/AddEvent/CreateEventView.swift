//
//  CreateEventView.swift
//  Agenda
//
//  Created by Diego Moreno on 20/1/23.
//

import SwiftUI

struct CreateEventView: View {
    @Binding var shouldShowNewEvent: Bool
    @State var eventName: String = ""
    @State var eventDate: Date = Date()
    @State var timeString: String = ""
    var completion: () -> () = {}
    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                Text("Create new event")
                    .foregroundColor(.pink)
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 50)
                Spacer()
                DatePicker("", selection: $eventDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(30)
                
                TextField("Nombre del evento", text: $eventName)
                    .foregroundColor(.black)
                    .frame(height: 40)
                    .background(.white)
                    .cornerRadius(10)
                    .autocorrectionDisabled(false)
                    .autocapitalization(.none)
                    .padding(.horizontal, 30)
                Spacer()
                Button {
                    if !eventName.isEmpty {
                        createEvents()
                    } else {
                        
                    }
                    
                } label: {
                    Text("Crear")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .heavy))
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                }
                .cornerRadius(40)
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            }
        }
    }
    
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
        completion()
        shouldShowNewEvent = false
    }
    
    func onError(error: String) {
        print(error)
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(shouldShowNewEvent: .constant(true))
    }
}
