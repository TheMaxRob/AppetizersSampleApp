//
//  User.swift
//  Appetizers
//
//  Created by Max Roberts on 1/1/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequentRefills = false
}
