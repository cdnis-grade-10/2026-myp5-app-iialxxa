//
//  SignInCheck.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 24/3/2026.
//
import FirebaseAuth
import Foundation

class SignInCheck : ObservableObject {
    
    @Published var currentUserId: String = ""
    private var  handler: AuthStateDidChangeListenerHandle?

    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
                                                    
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
     
}
