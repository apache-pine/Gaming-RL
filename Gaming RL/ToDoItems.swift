import Foundation


struct ToDoItem {
    var title: String
    var urgency: Int
    var points: Int
    var isComplete: Bool
    var theme: Theme
}

extension ToDoItem {
    static let sampleData: [ToDoItem] =
    [
        ToDoItem(title: "Buy groceries", urgency: 2, points: 10, isComplete: false, theme: .bubblegum),
        ToDoItem(title: "Do laundry", urgency: 1, points: 5, isComplete: false, theme: .buttercup),
        ToDoItem(title: "Finish project", urgency: 3, points: 20, isComplete: false, theme: .indigo)
    ]
}
