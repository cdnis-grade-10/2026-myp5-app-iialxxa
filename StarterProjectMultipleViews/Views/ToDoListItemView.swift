//
//  ToDoListItemView.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 13/3/2026.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    let item : ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title )
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item : item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

//#Preview {
//ToDoListItemView(item : .init(id: ""123, title: "getmilk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSinceReferenceDate, isDone: false))
//}
