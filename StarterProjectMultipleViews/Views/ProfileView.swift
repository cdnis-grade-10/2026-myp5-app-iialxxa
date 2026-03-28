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
              
                
            }
            .navigationTitle("Profile")
            
        }
    }
}

#Preview {
    ProfileView()
}
