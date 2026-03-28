//
//  LogInButton.swift
//  StarterProjectMultipleViews
//
//  Created by Alexandra HA on 21/3/2026.
//

import SwiftUI

struct LogInButton: View {
    let title : String
    let background : Color
    let action: () -> Void
    // action is a closure that takes no arguments
    var body: some View {
        Button{
            //action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }

    }
}
struct LogInButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInButton(title: "Values", background : .pink) {}
    }
}
