import SwiftUI

struct BodyPartPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedBodyPart: BodyPart?
    
    var body: some View {
        NavigationView {
            List(BodyPart.allCases) { bodyPart in
                Button(action: {
                    selectedBodyPart = bodyPart
                    dismiss()
                }) {
                    HStack {
                        Text(bodyPart.rawValue)
                        Spacer()
                        if selectedBodyPart == bodyPart {
                            Image(systemName: "checkmark")
                                .foregroundColor(SuperhumanTheme.primaryColor)
                        }
                    }
                }
            }
            .navigationTitle("Select Body Part")
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
} 