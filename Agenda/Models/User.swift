//
//  User.swift
//  Agenda
//
//  Created by Diego Moreno on 12/1/23.
//

import Foundation

struct User : Identifiable, Decodable {
    var id: Int
    var username : String = ""
    var password : String = ""
    var image : String = ""
}
