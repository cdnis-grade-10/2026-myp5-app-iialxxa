//
//  NewItemViewViewModel.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 24/3/2026.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
   
    init(){}
    
    func save (){
        guard canSave else {
            return
        }
        //Get current user id
            guard let uID = Auth.auth().currentUser?.uid else {
                return
        }
        
        //Create task/item model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        
        
        //Save model for saving to do lists
        let db = Firestore.firestore( )
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    
    
    
    var canSave : Bool {
        //prevents user from saing a bunch of spaces
        guard !title.trimmingCharacters(in:  .whitespaces).isEmpty else {
            return false
        }
        //this checks whether the due date is greater or equal to yesterday
        guard  dueDate >= Date().addingTimeInterval(-86400) else {
            return false
    }
        return true
        
    }
        
}

