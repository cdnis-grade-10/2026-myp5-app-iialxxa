//
//  LoginView.swift
//  StarterProjectMultipleViews

//  Created by Alexandra HA on 11/3/2026.
//

import SwiftUI
struct LoginView: View {
    
    @StateObject var viewModel =  LogInViewViewModel()
    var body: some View {
        //Log in form
        
        ZStack{
           
            NavigationStack{
                
                
                VStack {
                    
                
                VStack{
                    //Heading
                    Text("Welcome Back!").font(.system(size: 36, weight: .semibold))
                    .offset(y:10) }
                
                VStack{
                    
                    Form{
                        
                        //error message. If error message is not empty, it will show the error message
                        
                        TextField("Email address", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                        
                        
                        
                        //attempt log in
                        LogInButton(title: "Log In", background: .blue, action: {viewModel.login()}) //attempt log in
                    }
                    .frame(width: 400, height: 200)
                   
                }
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Create an account")
                            
                    }
                }
                . offset(y:10)
                .navigationTitle("")
            }
            
            if !viewModel.errorMessage.isEmpty{
                Text(viewModel.errorMessage)
                .foregroundColor(Color.red)}
            
            Image("left_Corner")
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x: -100, y: -340)
            
            Image("bottom_Right_Corner")
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x:100, y: 340)

                
            
            
        }
        
        
    }
    
}
    
    
    
    
    
#Preview {
    LoginView()
}
    
