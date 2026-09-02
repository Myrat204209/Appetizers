//
//  User.swift
//  Appetizers
//
//  Created by Azat Japarov on 02.09.26.
//

import Foundation

struct User : Codable {
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
