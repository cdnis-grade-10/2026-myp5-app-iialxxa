//
//  LoginView.swift
//  StarterProjectMultipleViews

//  Created by Alexandra HA on 11/3/2026.
//

import SwiftUI
struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    var body: some View {
        //Log in form
        
        
    NavigationStack{
        VStack{
            //Heading
            Text("Welcome Back!").font(.system(size: 36, weight: .semibold))
            .offset(y:10) }
        VStack{
                NavigationLink {
                    RegisterView() }label: {
                        Text("Create an account")
                            .offset(y:400)} }
            VStack{
                
                Form{
                    TextField("Email address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    //attempt log in
                    Button{
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.blue)
                            
                            Text("Log In")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
            }
            
            .frame(width: 400, height: 200)
        
           
            
                
            
        }
        
    }
    
    
}

