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
                //Avatar
                Image(systemName: "peron.circle")
                    .resizable()
                    .aspectRatio(contentMode : .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 125, height: 135)
                
                Rectangle()
                    .fill(Color.blue)
                    .cornerRadius(25)
                    .frame(width: 125, height: 135)
                
                
                
                //Info
                
                
              // Sign out
                
            }
            .navigationTitle("Profile")
            
        }
    }
}

//#Preview {
//    ProfileView()
//}
