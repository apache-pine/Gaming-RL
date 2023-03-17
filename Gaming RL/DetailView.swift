import SwiftUI

struct DetailView: View {
    let todo: ToDoItem
    
    @State private var isPresentingEditView = false
    
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
        }
        .navigationTitle(todo.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView()
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
            DetailView(todo: ToDoItem.sampleData[0])
        }
    }
}
