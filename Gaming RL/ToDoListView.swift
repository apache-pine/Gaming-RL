//
//  ContentView.swift
//  Gaming RL
//
//  Created by Kylar Sorensen on 3/7/23.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        VStack {
            Text("To-do List:")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Button(action: {
                // Add to list button action
            }, label: {
                Text("Add to list")
                    .font(.headline)
                    .foregroundColor(.white)
            })
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct ToDoListView_Preview: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
