//
//  ToDoListItem.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 28/3/2026.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate: TimeInterval
    var isDone : Bool

    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
