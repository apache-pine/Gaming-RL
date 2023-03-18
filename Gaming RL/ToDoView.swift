import SwiftUI

struct ToDoView: View {
    @Binding var todo: [ToDoItem]
    @State private var isPresentingNewTodoView = false
    @State private var newTodoData = ToDoItem.Data()
    @AppStorage ("totalScore") private var totalScore = 0
    
    var body: some View {
        VStack {
            Label("Score: \(totalScore)", systemImage: "star.circle")
            List {
                ForEach($todo) { $todoEach in
                    NavigationLink(destination: DetailView(todo: $todoEach, totalScore: $totalScore, deleteItem: {item in
                        todo.removeAll(where: { $0 == item })
                    })) {
                        CardView(todo: todoEach)
                    }
                    .listRowBackground(todoEach.theme.mainColor)
                }
            }
            .navigationTitle("To-do List:")
            .toolbar {
                Button(action: {
                    isPresentingNewTodoView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New To-do Item")
            }
            .sheet(isPresented: $isPresentingNewTodoView) {
                NavigationView {
                    DetailEditView(data: $newTodoData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingNewTodoView = false
                                    newTodoData = ToDoItem.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newTodo = ToDoItem(title: newTodoData.title, urgency: Int(newTodoData.urgency), points: newTodoData.points, isComplete: false, theme: newTodoData.theme)
                                    todo.append(newTodo)
                                    isPresentingNewTodoView = false
                                    newTodoData = ToDoItem.Data()
                                }
                            }
                        }
                }
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoView(todo: .constant(ToDoItem.sampleData))
        }
    }
}
