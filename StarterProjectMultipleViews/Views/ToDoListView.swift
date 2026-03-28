//
//  ToDoListView.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 13/3/2026.
//
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items : [ToDoListItem]
    private let userId:  String
    
    init(userId: String){
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
              
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            //shows new item view as a sheet
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

//#Preview {
//    ToDoListView(userId:"bn6DHk9GWCSngDGevoK4b1XP6a02")
//}
