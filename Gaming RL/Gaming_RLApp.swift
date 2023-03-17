import SwiftUI

@main
struct Gaming_RLApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ToDoView(todo: ToDoItem.sampleData)
            }
        }
    }
}
