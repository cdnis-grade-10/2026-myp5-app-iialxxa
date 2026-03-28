//
//  User.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 24/3/2026.
//

import Foundation

//user object codable is user so that we can use a extension to be able to convert anythign that is codable into a dictionary. This create
//strings and values that can be put into the app's database
struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
