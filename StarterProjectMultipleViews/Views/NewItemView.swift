//
//  NewItemView.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 13/3/2026.
//

import SwiftUI

struct NewItemView: View {
    
   @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool 
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form{
                //title
                TextField("Title", text: $viewModel.title)
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                LogInButton(title: "Save", background: .blue) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else{
                        viewModel.showAlert = true
                    }
                }
                    .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message:  Text("Please fill in all fields and select due date today or more"))
            
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
         return true
    }, set: { _ in
        
    }))
}

