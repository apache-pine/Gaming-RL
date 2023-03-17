import Foundation


struct ToDoItem {
    let id: UUID
    var title: String
    var urgency: Int
    var points: Int
    var isComplete: Bool
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, urgency: Int, points: Int, isComplete: Bool, theme: Theme) {
        self.id = id
        self.title = title
        self.urgency = urgency
        self.points = points
        self.isComplete = isComplete
        self.theme = theme
    }
}

extension ToDoItem {
    struct Data {
        var title: String = ""
        var urgency: Double = 1
        var points: Int = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, urgency: Double(urgency), points: Int(points), theme: theme)
    }
}

extension ToDoItem {
    static let sampleData: [ToDoItem] =
    [
        ToDoItem(title: "Buy groceries", urgency: 2, points: 10, isComplete: false, theme: .oxblood),
        ToDoItem(title: "Do laundry", urgency: 1, points: 5, isComplete: false, theme: .bubblegum),
        ToDoItem(title: "Finish project", urgency: 3, points: 20, isComplete: false, theme: .teal)
    ]
}
