//
//  HudView.swift
//  Agenda
//
//  Created by Diego Moreno on 27/1/23.
//

import SwiftUI

struct AlertCustom: ViewModifier {
    
    var title: String
    var message: String
    
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $show) {
                Alert(
                    title: Text(title),
                    message: Text(message)
                )
            }
    }
}

extension View {
    func alertCustom(title: String, message: String, show: Binding<Bool>) -> some View {
        modifier(AlertCustom(title: title, message: message, show: show))
    }
}
