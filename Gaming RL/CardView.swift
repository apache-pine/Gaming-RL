import SwiftUI

struct CardView: view {
    let todo: ToDoItem
    var body: some View {
        VStack(alignment: .leading) {
            Text{todo.title}
                .font(.headline)
            Spacer()
            HStack {
                Label("\(todo.urgency)", systemImage: "exclamationmark.triangle")
                Spacer()
                Label("\(todo.points)", systemImage: "star")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(todo.theme.accentColor)
    }
}

struct CardView_Preview: PreviewProvider {
    static var todo = ToDoItem.sampleData[0]
    static var previews: some View {
        CardView(todo: todo)
            .background(todo.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}