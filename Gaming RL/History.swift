import Foundation

struct History: Identifiable {
    let id: UUID
    let date: Date
    var urgency: Int
    var points: Int
    
    init(id: UUID = UUID(), date: Date = Date(), urgency: Int = 1, points: Int = 5) {
        self.id = id
        self.date = date
        self.urgency = urgency
        self.points = points
    }
}
