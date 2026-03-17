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
        VStack{
            //Heading
            Text("Welcome Back!").font(.system(size: 36, weight: .semibold))
            .offset(y: 300) }
        VStack{
            Form{
                TextField("Email address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Email address", text: $password)
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
        .offset(y: 300)
    
        
        //create account
        
        VStack{
            Button( "Create an account" )
                .padding(.bottom,50) }
            Spacer()
            
        }
        
    }
    




