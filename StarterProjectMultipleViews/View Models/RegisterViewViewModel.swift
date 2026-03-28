//
//  RegisterViewViewModel.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 21/3/2026.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
class RegisterViewViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register(){
        guard validate() else{ return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
        
    }
    //inserting model for a user into database
    private func insertUserRecord(id : String) {
        let newUser = User(id: id, name: name, email: email, joined: Date( ).timeIntervalSince1970)
        
        let db = Firestore.firestore()
        // db is short of database. In Firestore, there will be a collection that will store user information
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
   
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains( "@" ) &&  email.contains(".") else {
            return false
        }
        //for security reasons password sets shoudl at least be 7 characrcters long. This line of code checks whether the
        //password the user inputed is 6 chacaters or less
        guard password.count >= 6 else {
            return false
        }
        return true
        }
   
}
