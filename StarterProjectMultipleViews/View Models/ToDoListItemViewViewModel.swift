//
//  ToDoListItemViewViewModel.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 24/3/2026.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
//for signle to do list item (each row in item's list)
class ToDoListItemViewViewModel : ObservableObject {
    init(){
        
    }
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
        return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}


