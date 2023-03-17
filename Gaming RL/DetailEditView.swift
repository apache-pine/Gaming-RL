import SwiftUI

struct DetailEditView: View {
    @Binding var data: ToDoItem.Data
    
    var body: some View {
        Form {
            Section(header: Text("Item Details")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.urgency, in: 1...3, step: 1) {
                        Text("Urgency")
                    }
                    .accessibilityValue("Urgency level \(Int(data.urgency))")
                    Spacer()
                    Text("Urgency: \(Int(data.urgency))")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(ToDoItem.sampleData[0].data))
    }
}
