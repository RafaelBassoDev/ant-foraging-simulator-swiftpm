import SwiftUI

struct ActionButton: View {
    
    var title: String
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(.white)
            .frame(width: 90, height: 50)
            .padding(.horizontal, 10)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
