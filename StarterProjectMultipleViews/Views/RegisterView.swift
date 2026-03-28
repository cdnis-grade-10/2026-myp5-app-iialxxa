//
//  RegisterView.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 13/3/2026.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel =  RegisterViewViewModel()
    var body: some View {
        
        ZStack{
          
            
            VStack{
                
                Form{
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    LogInButton(title: "Create an account",
                                background: .blue
                    ) {
                        viewModel.register()
                    }
                    
                }
                .frame(width: 400, height: 250)
            }
            Image("left_Corner")
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x: -100, y: -340)
            
            Image("bottom_Right_Corner")
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x: 100, y: 340)
            
            Text("Welcome Back!").font(.system(size: 36, weight: .semibold))
            .offset(y:-160)
            
        }
       
            //Heading
           
    }
    
}

#Preview {
    RegisterView()
}
