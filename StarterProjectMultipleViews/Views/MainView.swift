//
//  MainView.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 24/3/2026.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = SignInCheck()
    var body: some View {
        if  viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
            //signed in
            //we pass through userID, as we userid as a refearnce for todolist items for that particular account
               
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView : some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
            
            
        }
    }
}




