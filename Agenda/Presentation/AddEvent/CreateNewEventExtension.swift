//
//  CreateNewEventExtension.swift
//  Agenda
//
//  Created by Diego Moreno on 30/1/23.
//

import SwiftUI

extension CreateEventView {
    
    func datePicker() -> some View {
        DatePicker("", selection: $viewModel.eventDate, displayedComponents: .date)
            .datePickerStyle(.graphical)
            .background(Color.white)
            .cornerRadius(10)
            .padding(30)
    }
    
    func textField() -> some View {
        TextField("Nombre del evento", text: $viewModel.eventName)
            .foregroundColor(.black)
            .frame(height: 40)
            .background(.white)
            .cornerRadius(10)
            .autocorrectionDisabled(false)
            .autocapitalization(.none)
            .padding(.horizontal, 30)
    }
    
    func btnAdd() -> some View{
        Button {
            if !viewModel.eventName.isEmpty {
                viewModel.createEvents()
            } else {
                viewModel.showAlert = true
            }
            
        } label: {
            Text("Crear")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
        }
        .cornerRadius(40)
        .padding(.horizontal, 50)
        .padding(.bottom, 20)
    }
}
