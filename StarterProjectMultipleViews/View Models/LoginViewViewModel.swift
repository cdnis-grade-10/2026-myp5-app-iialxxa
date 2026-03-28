//
//  LoginViewViewModel.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 21/3/2026.
//
import FirebaseAuth
import Foundation
//this classs will hold emmail and password data
class LogInViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    
    func login() {
        guard validate() else{
            return
        }
        
// Log In authentication
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    
    private func validate() -> Bool {
        //this is to reset the message. When this function first gets called on again for when the user attwmpts to log in agAIN, the error message will dissapear
        errorMessage = ""
        //guard makes sure email and paassword is not empty, and that if it is it will return.  trimmingCharacters(in: .whitespaces) makes usre that hat the user did not just fill in a bnch of spaces in the email and password sections. When both conditions are fullfilled,
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        //email@xx.com <-- checking to ensure email containes @ and .
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            return false
            
        }
   return true
    }
   
}

