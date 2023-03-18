import SwiftUI

struct DetailView: View {
    @Binding var todo: ToDoItem
    @Binding var totalScore: Int
    @State private var data = ToDoItem.Data()
    @State private var isPresentingEditView = false
    let deleteItem: (ToDoItem) -> Void
    
    var body: some View {
        List {
            Section(header: Text("Item Details")) {
                HStack {
                    Label("Urgency", systemImage: "exclamationmark.triangle")
                    Spacer()
                    Text("\(todo.urgency)")
                }
                HStack {
                    Label("Point Value", systemImage: "star.circle")
                    Spacer()
                    Text("\(todo.points)")
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(todo.theme.name)
                        .padding(5)
                        .foregroundColor(todo.theme.accentColor)
                        .background(todo.theme.mainColor)
                        .cornerRadius(6)
                }
            }
            HStack {
                Spacer()
                Button("Task Completed") {
                    todo.isComplete = true
                    totalScore += todo.points
                    deleteItem(todo)
                }
                .padding()
                .foregroundColor(todo.theme.accentColor)
                Spacer()
            }
            .background(todo.theme.mainColor)
        }
        .navigationTitle(todo.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = todo.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(todo.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                todo.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(todo: .constant(ToDoItem.sampleData[0]), totalScore: .constant(100), deleteItem: {_ in })
        }
    }
}
