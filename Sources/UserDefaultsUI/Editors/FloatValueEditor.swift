import SwiftUI

struct FloatValueEditor: View {
    
    @State private var text: String
    
    @FocusState private var isFocused: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    private var apply: (Float) -> Void
    
    init(value: Float, apply: @escaping (Float) -> Void) {
        _text = State(initialValue: String(value))
        self.apply = apply
    }
    
    var body: some View {
        VStack {
            TextField("", text: $text)
                .labelsHidden()
                .keyboardType(.numbersAndPunctuation)
                .focused($isFocused)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color(white: 0, opacity: 0.05))
                .cornerRadius(8)
                .padding()
                .onAppear {
                    isFocused = true
                }
            Button {
                let value = Float(text) ?? 0
                apply(value)
                text = "\(value)"
                dismiss()
            } label: {
                Text("Apply")
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
            Spacer()
        }
    }
}

// Comment out until Xcode 15 goes live.
/*
#Preview {
    FloatValueEditor(value: 3.141592654, apply: { value in print(value) })
}
*/
