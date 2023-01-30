//
//  HomeView.swift
//  Agenda
//
//  Created by Diego Moreno on 17/1/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @State var shouldShowNewEvent: Bool = false
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                titleViews(title: "Agéndame esta")
                ScrollView {
                    LazyVStack() {
                        ForEach(viewModel.events) { event in
                            HStack {
                                Text(event.name)
                                    .lineLimit(1)
                                Spacer()
                                Text(viewModel.unixToDate(date: event.date))
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
            CreateEventView(showNewEvent: $shouldShowNewEvent) {
                viewModel.getEvents()
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
            viewModel.getEvents()
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
