//
//  ProfileView.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 13/3/2026.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init(){
        
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                    if let user = viewModel.user {
                    //Avatar
                    ZStack{
                        
                        Rectangle()
                            .fill(Color.blue)
                            .cornerRadius(25)
                            .frame(width: 350, height: 270)
                            .padding(.top,-200)
                        
                        
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode : .fit)
                            .frame(width: 225, height: 225)
                            .padding(.top,-200)
                            .foregroundStyle(Color.white, Color.black)
                        
                    }
                    .padding(.top,25)
                
                    //Info
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding(10)
                        HStack{
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding(10)
                        HStack{
                            Text("Member since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding(10)
                    }
                    
                    
                    // Sign out
                    ZStack{
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.red)
                            .frame(width: 200, height: 50)
                            .offset(y:0)
                        
                        
                        Button("Log Out") {
                            viewModel.logOut()
                        }
                        .tint(.white)
                        .bold()
                        .padding(.bottom)
                        
                        
                    }
                
                    
                    } else {
                        Text("Loading Profile.....")
                    }
                    
                }
            .navigationTitle("Profile")
        
            }
        .onAppear {
        viewModel.fetchUser()
    }
        }
            
    }


#Preview {
    ProfileView()
}
