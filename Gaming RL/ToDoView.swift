import SwiftUI

struct ToDoView: View {
    let todo: [ToDoItem]
    
    var body: some View {
        VStack {
            Label("Score: ", systemImage: "star.circle")
            List {
                ForEach(todo, id: \.id) { todo in
                    NavigationLink(destination: DetailView(todo: todo)) {
                        CardView(todo: todo)
                    }
                    .listRowBackground(todo.theme.mainColor)
                }
            }
            .navigationTitle("To-do List:")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New To-do Item")
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoView(todo: ToDoItem.sampleData)
        }
    }
}
