import SwiftUI

@main
struct Gaming_RLApp: App {
    @State private var todo = ToDoItem.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ToDoView(todo: $todo)
            }
        }
    }
}
