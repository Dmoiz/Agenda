//
//  CreateEventView.swift
//  Agenda
//
//  Created by Diego Moreno on 20/1/23.
//

import SwiftUI

struct CreateEventView: View {
    
    
    // MARK: - Properties
    @Binding var showNewEvent: Bool
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var completion: () -> ()
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                titleViews(title: "Crear evento")
                Spacer()
                datePicker()
                textField()
                Spacer()
                btnAdd()
            }
        }
        .onReceive(viewModel.$shouldCloseView, perform: { newValue in
            if newValue {
                completion()
                showNewEvent = false
            }
        })
        .alertCustom(title: viewModel.title, message: viewModel.message, show: $viewModel.showAlert)
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(showNewEvent: .constant(true), completion: {})
    }
}
