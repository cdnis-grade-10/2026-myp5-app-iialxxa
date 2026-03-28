//
//  ToDoListViewViewModel.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 29/3/2026.
//
import FirebaseFirestore
import Foundation

import Foundation
 //view model for list of items
class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId : String
    
    init(userId : String){
        self.userId = userId
    }
    //delete to do list item. Parameter id is the id of the item we need to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
